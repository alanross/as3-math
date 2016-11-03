package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathRound
	{
		public function TestMathRound()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 1.0;
			var result:Number = Maths.round( 1.1 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = -1.0;
			var result:Number = Maths.round( -1.1 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathRound]";
		}
	}
}