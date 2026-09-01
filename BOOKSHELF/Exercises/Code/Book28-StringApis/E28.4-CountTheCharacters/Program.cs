string[] samples =
[
    "hello",
    "caf\u00e9",                  // precomposed e-acute
    "cafe\u0301",                 // e + combining acute  (same on screen!)
    "\U0001F44D",                 // thumbs up
    "\U0001F468\u200D\U0001F469\u200D\U0001F467\u200D\U0001F466"  // family emoji
];

try
{
    foreach (var s in samples)
        Console.WriteLine($"units={Solution.CountCodeUnits(s),2}  runes={Solution.CountRunes(s),2}  graphemes={Solution.CountGraphemes(s),2}");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
