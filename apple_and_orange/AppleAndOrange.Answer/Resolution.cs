using System.Linq;

namespace AppleAndOrange.Answer
{
    public class Resolution
    {
        public (int, int) Execute(int startPointOfHouse, int endPointOfHouse, int appleTreeLocation, int orangeTreeLocation, int[] fallenApples, int[] fallenOranges)
        {
            var fallenApplesOnHouse = fallenApples
                .Select(it => appleTreeLocation + it)
                .Where(it => it >= startPointOfHouse && it <= endPointOfHouse)
                .Count();

            var fallenOrangesOnHouse = fallenOranges
                .Select(it => orangeTreeLocation + it)
                .Where(it => it >= startPointOfHouse && it <= endPointOfHouse)
                .Count();

            return (fallenApplesOnHouse, fallenOrangesOnHouse);
        }
    }
}