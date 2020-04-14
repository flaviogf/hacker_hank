using System;
using System.Linq;

namespace Staircase.Answer
{
    public class Resolution
    {
        public string[] Execute(int count)
        {
            var result = Enumerable.Range(0, count).Select((it, index) => new string('#', index + 1).PadLeft(count, ' ')).ToArray();

            foreach (var it in result)
            {
                Console.WriteLine(it);
            }

            return result;
        }
    }
}
