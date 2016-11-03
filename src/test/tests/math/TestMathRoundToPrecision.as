package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathRoundToPrecision
	{
		public function TestMathRoundToPrecision()
		{
		}

		[Test(description="")]
		public function testRoundPositive():void
		{
			Assert.assertEquals( 0, Maths.roundToPrecision( 0.0, 0 ) );

			Assert.assertEquals( 0, Maths.roundToPrecision( 0.15151, 0 ) );
			Assert.assertEquals( 0.2, Maths.roundToPrecision( 0.15151, 1 ) );
			Assert.assertEquals( 0.15, Maths.roundToPrecision( 0.15151, 2 ) );
			Assert.assertEquals( 0.152, Maths.roundToPrecision( 0.15151, 3 ) );
			Assert.assertEquals( 0.1515, Maths.roundToPrecision( 0.15151, 4 ) );
		}

		[Test(description="")]
		public function testRoundNegative():void
		{
			Assert.assertEquals( 0, Maths.roundToPrecision( -0.15151, 0 ) );
			Assert.assertEquals( -0.2, Maths.roundToPrecision( -0.15151, 1 ) );
			Assert.assertEquals( -0.15, Maths.roundToPrecision( -0.15151, 2 ) );
			Assert.assertEquals( -0.152, Maths.roundToPrecision( -0.15151, 3 ) );
			Assert.assertEquals( -0.1515, Maths.roundToPrecision( -0.15151, 4 ) );
		}

		[Test(description="")]
		public function testRoundBounds():void
		{
			Assert.assertEquals( Number.MAX_VALUE, Maths.roundToPrecision( Number.MAX_VALUE, 0 ) );
			Assert.assertEquals( -Number.MAX_VALUE, Maths.roundToPrecision( -Number.MAX_VALUE, 0 ) );
		}

		public function toString():String
		{
			return "[TestMathRoundToPrecision]";
		}
	}
}