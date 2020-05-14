using System;
using System.Linq;

namespace ClimbingTheLeaderBoard.Answer
{
    public class Resolution
    {
        public int[] Execute(int[] scores, int[] player)
        {
            var distinct = scores.Distinct().ToArray();

            var result = player.Select(p => Position(distinct, p));

            return result.ToArray();
        }

        private static int Position(int[] scores, int score)
        {
            var position = Array.FindIndex(scores, (s) => s <= score);

            if (position != -1)
            {
                return position + 1;
            }

            return scores.Length + 1;
        }
    }
}