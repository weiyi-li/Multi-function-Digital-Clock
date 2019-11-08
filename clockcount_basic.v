module clockcount_basic(clk,rstn,sec0,sec1,min0,min1,enaclk,enaset,enastp,enactd,key0,key1,key2,key3,led);
   input clk;
   input rstn;//Reset bar
   input enaclk;//Enable clock counting
	input enaset;//Enable time setting
	input enastp;//Enable stopwatch
	input enactd;//Enable countdown                
	//Represent key3 to key0
	input key0;
	input key1;
	input key2;
	input key3;
	
   output reg[3:0]sec0;//Unit digit of second 
   output reg[3:0]sec1;//Tens digit of second 
   output reg[3:0]min0;//Tens digit of minute 
   output reg[3:0]min1;//Tens digit of minute
	output led;
	reg led;
	reg [26:0]count;

always@(posedge clk  or negedge rstn)
begin
//----------Initial zero status----------
if (!rstn)
	begin
		sec0<=0;
		sec1<=0;
		min0<=0;
		min1<=0;
		count=0;
	end

//----------Clock counting begins----------
else if(count==27000000&enaclk)
   begin
		count<=0;
		sec0<=sec0+1;
		if(sec0==9)
      begin
	      sec0 <= 0;
	      sec1 <= sec1+1;	
			if (sec1==5)
			   begin
			      sec1<=0;
			      min0<=min0+1;
		         if(min0==9)
               begin
	               min0 <= 0;
	               min1 <= min1+1;	
			         if (min1==5)
				      begin
				         min1<=0;
				      end
						else
						min1<=min1+1;
			      end
					else
			      min0<=min0+1;
			   end
			else
			sec1<=sec1+1;
      end
	   else	
		sec0<=sec0+1;
   end
         
	   
//----------Time setting begins----------
else if (count==2700000&enaset)
	begin
		count=0;
   //----------The first key on the right----------	
		if(sec0<9&!key0)
		begin
			sec0<=sec0+1;
		end
		else if(sec0>=9&!key0)
		begin
			sec0<=0;
		end
   //----------The second key on the right----------					  
		else if(sec1<9&!key1)
		begin
			sec1<=sec1+1;
		end
		else if(sec1>=9&!key1)
		begin
			sec1<=0;
		end
   //----------The third key on the right----------	
		else if(min0<9&!key2)
		begin
			min0<=min0+1;
		end
		else if(min0>=9&!key2)
		begin
			min0<=0;
		end
   //----------The fourth key on the right----------				
      else if(min1<9&!key3)
		begin
			min1<=min1+1;
		end
		else if(min1>=9&!key3)
		begin
			min1<=0;
		end
	end

//----------Stopwatch counting begins----------
else if(count==2700000&enastp)
   begin
		count<=0;
		sec0<=sec0+1;
		if(sec0==9)
      begin
	      sec0 <= 0;
	      sec1 <= sec1+1;	
			if (sec1==9)
		   begin
            sec1<=0;
			   min0<=min0+1;
		      if(min0==5)
            begin
	            min0 <= 0;
	            min1 <= min1+1;	
			      if (min1==9)
			      begin
			         min1<=0;
			      end
					else	
		         min1<=min1+1;
			   end
				else	
		      min0<=min0+1;
			end
			else	
		   sec1<=sec1+1;
		end
		else	
		sec0<=sec0+1;
   end
	
//----------Time setting begins----------
else if (count==6000000&enaset)
	begin
		count=0;
   //----------The first key on the right----------	
		if(sec0<9&!key0)
		begin
			sec0<=sec0+1;
		end
		else if(sec0>=9&!key0)
		begin
			sec0<=0;
		end
   //----------The second key on the right----------					  
		else if(sec1<9&!key1)
		begin
			sec1<=sec1+1;
		end
		else if(sec1>=9&!key1)
		begin
			sec1<=0;
		end
   //----------The third key on the right----------	
		else if(min0<9&!key2)
		begin
			min0<=min0+1;
		end
		else if(min0>=9&!key2)
		begin
			min0<=0;
		end
   //----------The fourth key on the right----------				
      else if(min1<9&!key3)
		begin
			min1<=min1+1;
		end
		else if(min1>=9&!key3)
		begin
			min1<=0;
		end
	end

//----------LED begins----------
else if (count==27000000)
   begin
		count<=0;
      if(sec0==9)
      begin
	      led=1'b1;
      end
	   else	
		led=1'b0;
	end

//----------Countdown begins----------	
else if(count==2700000 & enactd)
	begin
      count<=0;
	   sec0<=sec0-1;
		if(sec0==0)
      begin
	      sec0 <= 9;
	      sec1 <= sec1-1;	
			if (sec0==0&sec1==0)
			begin
			   sec1<=9;
			   sec0<=9;
			   min0<=min0-1;
		      if(sec0==0&sec1==0&min0==0)
            begin
			      sec0 <= 0;
			      sec1 <= 0;
					min0 <= 6;
	            min1 <= min1-1;	  
				   if(sec0==0&sec1==0&min0==0&min1==0)
	            begin
			         sec0<=0;
			         sec1<=0;
			         min0<=0;
			         min1<=0;
		         end
					else
	            min1 <= min1-1;
				end
				else
	         min0 <= min0-1;	
			end
	      else
	      sec1 <= sec1-1;		
	   end
      else
	   sec0 <= sec0-1;		
	end 
	
//----------Automatic counting----------	 
else if (enaclk|enaset|enastp|enactd)
		begin
		   count<=count+1;
		end

end 
endmodule 