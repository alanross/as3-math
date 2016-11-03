package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathDeg2Rad
	{
		public function TestMathDeg2Rad()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.deg2rad( 0.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 6.283185307179586;
			var result:Number = Maths.deg2rad( 360 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathDeg2Rad]";
		}
	}
}