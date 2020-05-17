public class Main
{
    static {
      System.loadLibrary("libcec20");
    }

    public static void main(String[] args) 
    {
        int functionNumber = Integer.parseInt(args[0]);
        int nDimensions = Integer.parseInt(args[1]);
        int nInputs = 1;

        SWIGTYPE_p_double x = CEC2020Benchmark.new_double_array(nDimensions);
        SWIGTYPE_p_double result = CEC2020Benchmark.new_double_array(nInputs);

        for (int i = 0; i < nDimensions; i++)
        {
            double value = 420.9687;
            CEC2020Benchmark.double_array_setitem(x, i, value);
        }

        CEC2020Benchmark.cec20_test_func(x, result, nDimensions, nInputs, functionNumber);

        double[] javaResult = new double[nInputs];
        for (int i = 0; i < nInputs; i++)
        {
            javaResult[i] = CEC2020Benchmark.double_array_getitem(result, i);
            System.out.println(javaResult[i]);
        }
        
        CEC2020Benchmark.delete_double_array(x);
        CEC2020Benchmark.delete_double_array(result);
    }
}