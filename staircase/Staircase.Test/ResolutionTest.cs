using Staircase.Answer;
using Xunit;

namespace Staircase.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Execute_WhenIsExecutedWithCountFour_ShouldReturnTheStaircase()
        {
            var resolution = new Resolution();

            var expected = new string[]
            {
                "   #",
                "  ##",
                " ###",
                "####"
            };

            Assert.Equal(expected, resolution.Execute(4));
        }
    }
}
