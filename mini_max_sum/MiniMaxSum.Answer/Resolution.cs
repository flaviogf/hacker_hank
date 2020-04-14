using System;
using System.Linq;

namespace MiniMaxSum.Answer
{
    public class Resolution
    {
        public long[] Execute(long[] numbers)
        {
            var sorted = new long[numbers.Length];

            Array.Copy(numbers, sorted, numbers.Length);

            Array.Sort(sorted);

            var max = sorted.Skip(1).Take(4).Sum();

            var min = sorted.Take(4).Sum();

            Console.WriteLine("{0} {1}", min, max);

            return new long[] { min, max };
        }
    }
}