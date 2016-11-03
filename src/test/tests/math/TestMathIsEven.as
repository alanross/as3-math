package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathIsEven
	{
		public function TestMathIsEven()
		{
		}

		[Test(description="")]
		public function test():void
		{
			Assert.assertEquals( true, Maths.isEven( -4 ) );
			Assert.assertEquals( false, Maths.isEven( -3 ) );
			Assert.assertEquals( true, Maths.isEven( -2 ) );
			Assert.assertEquals( false, Maths.isEven( -1 ) );
			Assert.assertEquals( true, Maths.isEven( 0 ) );
			Assert.assertEquals( false, Maths.isEven( 1 ) );
			Assert.assertEquals( true, Maths.isEven( 2 ) );
			Assert.assertEquals( false, Maths.isEven( 3 ) );
			Assert.assertEquals( true, Maths.isEven( 4 ) );

			Assert.assertEquals( false, Maths.isEven( int.MAX_VALUE ) );	//  2147483647
			Assert.assertEquals( true, Maths.isEven( int.MIN_VALUE ) ); 	// -2147483648
		}

		public function toString():String
		{
			return "[TestMathIsEven]";
		}
	}
}