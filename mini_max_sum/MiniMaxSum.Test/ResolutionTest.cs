using MiniMaxSum.Answer;
using Xunit;

namespace MiniMaxSum.Test
{
    public class ResolutionTest
    {
        [Theory]
        [InlineData(new object[] { new long[] { 1, 2, 3, 4, 5 }, new long[] { 10, 14 } })]
        [InlineData(new object[] { new long[] { 1, 3, 5, 7, 9 }, new long[] { 16, 24 } })]
        [InlineData(new object[] { new long[] { 942381765, 627450398, 954173620, 583762094, 236817490 }, new long[] { 2390411747, 3107767877 } })]
        public void Execute_WhenGivenAnArrayWithNumbers_ShouldReturnTheMinSumAndTheMaxSumOfItElements(long[] numbers, long[] expected)
        {
            var resoultion = new Resolution();

            Assert.Equal(expected, resoultion.Execute(numbers));
        }
    }
}