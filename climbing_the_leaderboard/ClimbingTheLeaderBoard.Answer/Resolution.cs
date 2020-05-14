using System;
using System.Collections.Generic;
using System.Linq;

namespace ClimbingTheLeaderBoard.Answer
{
    public class Resolution
    {
        public int[] Execute(int[] scores, int[] player)
        {
            var ranking = new List<int>();

            var position = 0;

            for (var i = 0; i < scores.Length; i++)
            {
                if (position == 0)
                {
                    ranking.Add(++position);
                }
                else if (scores[i - 1] != scores[i])
                {
                    ranking.Add(++position);
                }
                else
                {
                    ranking.Add(position);
                }
            }

            var last = ranking.Last();

            var result = player.Select(p =>
            {
                var index = Array.FindIndex(scores, s => s <= p);

                return index == -1 ? last + 1 : ranking[index];
            });

            return result.ToArray();
        }
    }
}