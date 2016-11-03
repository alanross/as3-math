package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathAbs
	{
		public function TestMathAbs()
		{
		}

		[Test(description="Test positive abs")]
		public function testPositive():void
		{
			var expected:int = 1;
			var result:int = Maths.abs( 1 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="Test negative abs")]
		public function testNegative():void
		{
			var expected:int = 1;
			var result:int = Maths.abs( -1 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="Test zero abs")]
		public function testZero():void
		{
			var expected:int = 0;
			var result:int = Maths.abs( 0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="Test number")]
		public function testNumber():void
		{
			var expected:Number = 1.2132;
			var result:Number = Maths.abs( -1.2132 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="Test max")]
		public function testMax():void
		{
			var expected:Number = Number.MAX_VALUE;
			var result:Number = Maths.abs( -Number.MAX_VALUE );
			Assert.assertEquals( expected, result );
		}

		[Test(description="Test nan")]
		public function testNAN():void
		{
			var result:Number = Maths.abs( NaN );
			Assert.assertTrue( isNaN( result ) );
		}

		public function toString():String
		{
			return "[TestMathAbs]";
		}
	}
}