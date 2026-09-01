// A logger with Debug DISABLED, that counts how much formatting work reached it.
class CountingLogger : ILoggerLike
{
    public int PrebuiltStringsReceived;
    public int TemplateCallsReceived;

    public bool IsDebugEnabled => false;

    public void LogDebug(string message) => PrebuiltStringsReceived++;

    public void LogDebug(string template, params object[] args) => TemplateCallsReceived++;
}

var logger = new CountingLogger();
var order = new Order(1, [new Item(1), new Item(2)]);
var customer = new Customer("Ada");

Solution.Log_Broken(logger, order, customer);
Console.WriteLine($"broken: built a full string even though Debug is off " +
                  $"({logger.PrebuiltStringsReceived} interpolations performed)");

try
{
    Solution.Log(logger, order, customer);
    Console.WriteLine($"fixed:  passed a template + args ({logger.TemplateCallsReceived} call)");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
