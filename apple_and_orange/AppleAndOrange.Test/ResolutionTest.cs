using AppleAndOrange.Answer;
using Xunit;

namespace AppleAndOrange.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Execute_WhenStartPointOfHouseIs7EndPointOfHouseIs11AppleTreeLocationIs5OrangeTreeLocationIs15FirstFallenAppleLocationIsMinus2SecondFallenAppleLocationIsTwoThirthFallenAppleLocationIsOneFirstFallenOrangeLocationIsFiveAndSecondFallenOrangeLocationIsMinusSix_ShouldReturnOneAndOne()
        {
            var resolution = new Resolution();

            var (apples, oranges) = resolution.Execute(startPointOfHouse: 7, endPointOfHouse: 11, appleTreeLocation: 5, orangeTreeLocation: 15, fallenApples: new int[] { -2, 2, 1 }, fallenOranges: new int[] { 5, -6 });

            Assert.Equal(1, oranges);
            Assert.Equal(1, apples);
        }
    }
}