package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathEquals
	{
		public function TestMathEquals()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.equals( 1.0, 1.0, 0.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.equals( 1.09, 1.0, 0.1 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathEquals]";
		}
	}
}