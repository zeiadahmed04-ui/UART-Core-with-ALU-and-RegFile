module fsm(
    input clk, rst,
    input RX_IN,
    input parity_en,
    input par_err, start_glitch, stop_err,
    input [5:0] bit_cnt,
    input [5:0] edge_cnt,
    input [5:0] prescale,
    output reg enable, data_sam_en, strt_ck_en, stop_ck_en, desr_en, par_ck_en,
    output reg data_valid_reg,
    output reg stop_error, parity_error
);

    reg [2:0] current_state, next_state; 
    reg data_valid;

    localparam  IDLE = 3'b000,
                start =3'b001,
                DATA = 3'b010,
                parity = 3'b011,
                stop = 3'b100;

    always@(posedge clk or negedge rst) begin
        if(!rst) begin
            current_state <= IDLE;
        end
        else
            current_state <= next_state;
	    
    end

    always@(posedge clk or negedge rst) begin
    	if(!rst) begin
    	    parity_error <= 0;
    	    data_valid_reg <= 0;
    	end
    	else if(current_state == IDLE || current_state == start) begin
    	    parity_error <= 0;
    	    data_valid_reg <= 0;
    	end                          
    	else if(current_state == parity && edge_cnt == prescale - 1) begin
    	    parity_error <= par_err;
    	    data_valid_reg <= data_valid;
    	end
    end

    always@(*) begin

            stop_ck_en = 0;
            par_ck_en = 0;
            strt_ck_en = 0;
            enable = 0;
            data_sam_en = 0;
            desr_en = 0;
            stop_error = 0;
            data_valid = 0;
            next_state = current_state;

        case(current_state)
            IDLE: begin
                if(RX_IN == 0) begin
                    next_state = start;
                end
                else
                    next_state = IDLE;
            end

            start: begin
                enable = 1;
                strt_ck_en = 1;
                data_sam_en = 1;
                if(edge_cnt == prescale - 1) begin
                    if(start_glitch == 0) begin
                        next_state = DATA;
                    end
                    else
                        next_state = IDLE;
                end
            end

            DATA: begin
                enable = 1;
                data_sam_en = 1;
                desr_en     = (edge_cnt == prescale/2 + 1);
                if(edge_cnt == prescale - 1 && bit_cnt == 8) begin
                    if(parity_en == 1)
                        next_state = parity;
                    else
                        next_state = stop;
                end
            end

            parity: begin
                enable = 1;
                par_ck_en = 1;
                data_sam_en = 1;
                if(edge_cnt == prescale - 1) begin
                    next_state = stop;
                end
            end
            stop: begin
                enable = 1;
                stop_ck_en = 1;
                data_sam_en = 1;
                if(edge_cnt == prescale - 1) begin
                    stop_error = stop_err;
                    data_valid = !(stop_err || parity_error);
                    if(RX_IN == 0)          
                        next_state = start;
                    else
                        next_state = IDLE;
                end
            end
            default: begin
                stop_ck_en = 0;
                par_ck_en = 0;
                strt_ck_en = 0;
                enable = 0;
                data_sam_en = 0;
                desr_en = 0;
                data_valid = 0;
                stop_error = 0;
                next_state = IDLE;
            end
        endcase
    end




endmodule
