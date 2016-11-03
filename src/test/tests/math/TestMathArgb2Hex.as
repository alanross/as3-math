package tests.math
{
	import com.ar.math.Colors;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathArgb2Hex
	{
		public function TestMathArgb2Hex()
		{
		}

		[Test(description="")]
		public function testWhite():void
		{
			var expected:int = 0xFFFFFFFF;
			var result:int = Colors.argb2hex( 255, 255, 255, 255 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function testBlack():void
		{
			var expected:int = 0x00000000;
			var result:int = Colors.argb2hex( 0, 0, 0, 0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function testAlpha():void
		{
			var expected:int = 0xFF000000;
			var result:int = Colors.argb2hex( 255, 0, 0, 0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function testRed():void
		{
			var expected:int = 0x00FF0000;
			var result:int = Colors.argb2hex( 0, 255, 0, 0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function TestGreen():void
		{
			var expected:int = 0x0000FF00;
			var result:int = Colors.argb2hex( 0, 0, 255, 0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function testBlue():void
		{
			var expected:int = 0x000000FF;
			var result:int = Colors.argb2hex( 0, 0, 0, 255 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathArgb2Hex]";
		}
	}
}