using System.Linq;

namespace BirthdayCakeCandles.Answer
{
    public class Resolution
    {
        public int Execute(int[] numbers)
        {
            var max = numbers.Max();

            var count = numbers.Where(it => it == max).Count();

            return count;
        }
    }
}
