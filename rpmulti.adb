with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Long_Integer_Text_IO; use Ada.Long_Integer_Text_IO;

procedure rpmulti is
    option : integer;    
    num1 : Long_Integer;
    num2 : Long_Integer;
    
    --Recursive multiplication method
    function rmultiply (num1: Long_Integer; num2: Long_Integer) return Long_Integer is
    begin
      if num1 = 0 then
            return 0;
        elsif num1 = 1 then
            return num2;
        elsif num1 > 1 then
            if num1 mod 2 = 0 then
                return rmultiply(num1 / 2, num2 + num2);
            else
                return rmultiply(num1 / 2, num2 + num2) + num2;
            end if;
        end if;  
    return 0; 
    end rmultiply;

    --Non-recursive multiplication method
    function multiply (num1: Long_Integer; num2: Long_Integer) return Long_Integer is
        rVal : Long_Integer := 0;
        num1Work : Long_Integer := num1;
        num2Work : Long_Integer := num2;
    begin
        if num1Work = 0 then
            return num1Work;
        elsif num1Work = 1 then
            return num2Work;
        end if;

        while num2Work > 0 loop
            if num2Work mod 2 /= 0 then 
                rVal := rVal + num1Work;
            end if;

            num1Work := num1Work + num1Work;
            num2Work := num2Work / 2;
        end loop;

        return rVal;
    end multiply;

    --Helper to print the results from either multiplication function
    procedure printResult (num1: Long_Integer; num2: Long_Integer; result: Long_Integer) is
    begin
        put(num1'Image);
        put(" * ");
        put(num2'Image);
        put(" = ");
        Put_Line(result'Image);
    end printResult;

    --'Main'
    begin
        --User input
        Put_Line("Please select which version you want to use:");
        Put_Line("1. Recursive");
        Put_Line("2. Non-recursive");
        put("> ");
        get(option);
        
        put("Enter the first number: ");
        get(num1);
        put("Enter the second number: ");
        get(num2);
        Put_Line("");
        
        --Do either recursive or non-recursive, whatever the user picks
        if option = 1 then
            printResult(num1, num2, rmultiply(num1, num2));
        elsif option = 2 then
            printResult(num1, num2, multiply(num1, num2));
        end if;
end rpmulti;

