//Intro to Apex Challenges

public class Calculator {
    
    public calculator() {
        
    }
    //challenge 1
    public Integer Add(Integer num1, Integer num2) {
        //Calculator calc = new calculator();
        return num1 + num2;
    }
    
    //challenge 2
    public Integer Multiply(Integer num1, Integer num2) {
        Integer product = 0;
        for(Integer i = 0; i<num2; i++) {
            product = product + num1;
            
        }
        
        return product;
    }
    
    //challenge 3 does not work if quotient is < 1
    public Integer Divide(Integer num1, Integer num2) {
        Integer counter = 0;
        Integer divisor = 0;
        Integer quotient = 0;
        while(counter < num1) {
            counter += num2;
            divisor += 1;
        }
        if(counter == num1) {
            quotient = divisor;
             
        }
        else {
            system.debug(num1 + ' is not evenly divisible by ' + num2);
        }
        return quotient;
    }
    
    
    //challenge 4 does not work if quotient is < 1
    public Integer Divide2(Integer num1, Integer num2) {
        Integer counter = 0;
        Integer divisor = 0;
        Integer quotient = 0;
        if(num2 == 0) {
            return 0;    
        }
        else {
        while(counter < num1) {
            counter += num2;
            divisor += 1;
        }
        if(counter == num1) {
            quotient = divisor;
             
        }
        else {
            system.debug(num1 + ' is not evenly divisible by ' + num2);
        }
        return quotient;
        }
    }

    //challenge 5
    public static Decimal mod(Integer num1, Integer num2) {
        Integer quotient = 0;
        Integer count = 0;
        
        for (Integer i = 0; i < num2; i++) {   
            quotient = quotient - num1;     
            count++;    
        }  
        return quotient;   
    }

}
