package tests {
	import tests.math.TestMathAbs;
	import tests.math.TestMathArgb2Hex;
	import tests.math.TestMathAverage;
	import tests.math.TestMathBezierCubic;
	import tests.math.TestMathBezierQuadratic;
	import tests.math.TestMathClamp;
	import tests.math.TestMathDeg2Rad;
	import tests.math.TestMathDist;
	import tests.math.TestMathEquals;
	import tests.math.TestMathEquals2D;
	import tests.math.TestMathHex2Argb;
	import tests.math.TestMathIsEven;
	import tests.math.TestMathIsInBounds;
	import tests.math.TestMathMax;
	import tests.math.TestMathMin;
	import tests.math.TestMathNextPowerOfTwo;
	import tests.math.TestMathNormalize;
	import tests.math.TestMathRad2Deg;
	import tests.math.TestMathRandom;
	import tests.math.TestMathRotateBy;
	import tests.math.TestMathRound;
	import tests.math.TestMathRoundToPrecision;
	import tests.math.TestMathScale;
	import tests.math.TestMathSum;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public final class MathTestSuite
	{
		// math
		public var tm01:TestMathAbs;
		public var tm02:TestMathArgb2Hex;
		public var tm03:TestMathAverage;
		public var tm04:TestMathBezierCubic;
		public var tm05:TestMathBezierQuadratic;
		public var tm07:TestMathClamp;
		public var tm08:TestMathDeg2Rad;
		public var tm09:TestMathDist;
		public var tm10:TestMathEquals;
		public var tm11:TestMathEquals2D;
		public var tm12:TestMathHex2Argb;
		public var tm13:TestMathMax;
		public var tm14:TestMathMin;
		public var tm15:TestMathNormalize;
		public var tm16:TestMathRad2Deg;
		public var tm17:TestMathRotateBy;
		public var tm18:TestMathRound;
		public var tm19:TestMathRoundToPrecision;
		public var tm20:TestMathScale;
		public var tm21:TestMathSum;
		public var tm22:TestMathIsInBounds;
		public var tm23:TestMathNextPowerOfTwo;
		public var tm24:TestMathIsEven;
		public var tm25:TestMathRandom;
	}
}