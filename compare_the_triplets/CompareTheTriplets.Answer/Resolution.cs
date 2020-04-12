using System.Collections.Generic;
using System.Linq;

namespace CompareTheTriplets.Answer
{
    public class Resolution
    {
        public List<int> Execute(List<int> itemsA, List<int> itemsB)
        {
            return Enumerable
                    .Zip(itemsA, itemsB, (a, b) => new { a, b })
                    .Aggregate(new List<int> { 0, 0 }, (acc, it) =>
                    {
                        if (it.a > it.b)
                        {
                            acc[0]++;
                        }
                        else if (it.a < it.b)
                        {
                            acc[1]++;
                        }

                        return acc;
                    });
        }
    }
}
