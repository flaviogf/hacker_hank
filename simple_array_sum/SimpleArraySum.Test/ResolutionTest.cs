using SimpleArraySum.Answer;
using Xunit;

namespace SimpleArraySum.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Should_Return_31_When_Is_Informed_The_Numbers_1_2_3_4_10_and_11()
        {
            var resolution = new Resolution();

            Assert.Equal(31, resolution.Execute(1, 2, 3, 4, 10, 11));
        }
    }
}
