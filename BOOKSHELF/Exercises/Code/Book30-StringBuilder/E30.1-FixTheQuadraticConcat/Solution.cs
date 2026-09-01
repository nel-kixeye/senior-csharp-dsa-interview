using System.Text;

public record Row(int Id, string Name);

public static class Solution
{
    // Rewrite each. State the complexity BEFORE and AFTER.
    // ONE OF THESE SHOULD NOT USE StringBuilder - identify it.
    // And for B: what does the compiler actually emit? That decides whether it
    // needs fixing at all.

    public static string A_Broken(IEnumerable<string> names)
    {
        string csv = "";
        foreach (var name in names) csv += name + ",";
        return csv;
    }

    public static string B_Broken(string firstName, string lastName)
    {
        string full = "";
        full += firstName; full += " "; full += lastName;
        return full;
    }

    public static string C_Broken(IEnumerable<Row> rows)
    {
        string report = "";
        foreach (var row in rows) report += $"{row.Id}\t{row.Name}\n";
        return report;
    }

    public static string D_Broken()
    {
        string padded = "";
        for (int i = 0; i < 40; i++) padded += "-";
        return padded;
    }

    // --- your rewrites ---
    public static string A(IEnumerable<string> names) => throw new NotImplementedException();
    public static string B(string firstName, string lastName) => throw new NotImplementedException();
    public static string C(IEnumerable<Row> rows) => throw new NotImplementedException();
    public static string D() => throw new NotImplementedException();
}
