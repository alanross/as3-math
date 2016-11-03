package tests.math
{
	import com.ar.math.Colors;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathHex2Argb
	{
		public function TestMathHex2Argb()
		{
		}

		[Test(description="")]
		public function testWhite():void
		{
			var expected:Array = [255, 255, 255, 255];
			var result:Array = Colors.hex2argb( 0xFFFFFFFF );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		[Test(description="")]
		public function testBlack():void
		{
			var expected:Array = [0, 0, 0, 0];
			var result:Array = Colors.hex2argb( 0x00000000 );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		[Test(description="")]
		public function testAlpha():void
		{
			var expected:Array = [255, 0, 0, 0];
			var result:Array = Colors.hex2argb( 0xFF000000 );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		[Test(description="")]
		public function testRed():void
		{
			var expected:Array = [0, 255, 0, 0];
			var result:Array = Colors.hex2argb( 0x00FF0000 );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		[Test(description="")]
		public function TestGreen():void
		{
			var expected:Array = [0, 0, 255, 0];
			var result:Array = Colors.hex2argb( 0x0000FF00 );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		[Test(description="")]
		public function testBlue():void
		{
			var expected:Array = [0, 0, 0, 255];
			var result:Array = Colors.hex2argb( 0x000000FF );

			Assert.assertEquals( expected[0], result[0] );
			Assert.assertEquals( expected[1], result[1] );
			Assert.assertEquals( expected[2], result[2] );
			Assert.assertEquals( expected[3], result[3] );
		}

		public function toString():String
		{
			return "[TestMathHex2Argb]";
		}
	}
}
