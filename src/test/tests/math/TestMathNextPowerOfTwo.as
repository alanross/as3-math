package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathNextPowerOfTwo
	{
		public function TestMathNextPowerOfTwo()
		{
		}

		[Test(description="")]
		public function test():void
		{
			var expected:Array = [ 0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048 ];

			const n:int = 2048;

			var e:int = 0;

			for( var i:int = 0; i < n; ++i )
			{
				if( i > expected[e] )
				{
					e++;
				}

				Assert.assertEquals( expected[e], Maths.nextPowerOfTwo( i ) );
			}
		}

		public function toString():String
		{
			return "[TestMathNextPowerOfTwo]";
		}
	}
}