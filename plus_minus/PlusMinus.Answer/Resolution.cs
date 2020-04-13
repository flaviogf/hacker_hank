using System;

namespace PlusMinus.Answer
{
    public class Resolution
    {
        public string[] Execute(int[] numbers)
        {
            var total = numbers.Length;

            var positiveCount = 0.0;
            var negativeCount = 0.0;
            var zeroCount = 0.0;

            foreach (var it in numbers)
            {
                if (it > 0)
                {
                    positiveCount++;
                    continue;
                }

                if (it < 0)
                {
                    negativeCount++;
                    continue;
                }

                zeroCount++;
            }

            var positivePercentage = positiveCount / total;
            var negativePercentage = negativeCount / total;
            var zeroPercentage = zeroCount / total;

            var positiveResult = positivePercentage.ToString("0.000000");
            var negativeResult = negativePercentage.ToString("0.000000");
            var zeroResult = zeroPercentage.ToString("0.000000");

            Console.WriteLine(positiveResult);
            Console.WriteLine(negativeResult);
            Console.WriteLine(zeroResult);

            return new string[] { positiveResult, negativeResult, zeroResult };
        }
    }
}