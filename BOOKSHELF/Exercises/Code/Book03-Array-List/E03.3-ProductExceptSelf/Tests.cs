using Xunit;
public class ProductExceptSelfTests { [Theory]
 [InlineData(new[] { 1,2,3,4 },new[] { 24,12,8,6 })] [InlineData(new[] { -1,1,0,-3,3 },new[] { 0,0,9,0,0 })] [InlineData(new[] { 0,0,1 },new[] { 0,0,0 })] [InlineData(new[] { 3,7 },new[] { 7,3 })] [InlineData(new[] { -1,-2,-3 },new[] { 6,3,2 })]
 public void ReturnsSpecifiedProducts(int[] nums,int[] expected) => Assert.Equal(expected,Solution.ProductExceptSelf(nums)); }
