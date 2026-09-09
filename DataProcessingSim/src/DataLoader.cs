using System.Globalization;
using System.Text.Json;

namespace DataProcessingSim;

public sealed class DataLoader
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    public IReadOnlyList<Order> LoadOrders(string path)
    {
        using var stream = File.OpenRead(path);
        return JsonSerializer.Deserialize<List<Order>>(stream, JsonOptions)
            ?? new List<Order>();
    }

    public IReadOnlyList<ShipmentEvent> LoadShipmentEvents(string path)
    {
        var lines = File.ReadLines(path).ToList();
        if (lines.Count <= 1)
        {
            return Array.Empty<ShipmentEvent>();
        }

        return lines.Skip(1)
            .Where(line => !string.IsNullOrWhiteSpace(line))
            .Select(ParseShipmentEvent)
            .ToList();
    }

    private static ShipmentEvent ParseShipmentEvent(string line)
    {
        var fields = line.Split(',', StringSplitOptions.None);
        DateTime? eventAt = fields.Length > 3 && DateTime.TryParse(
            fields[3],
            CultureInfo.InvariantCulture,
            DateTimeStyles.AssumeUniversal | DateTimeStyles.AdjustToUniversal,
            out var parsed)
            ? parsed
            : null;

        return new ShipmentEvent(
            Field(fields, 0),
            FieldOrNull(fields, 1),
            Field(fields, 2),
            eventAt,
            FieldOrNull(fields, 4));
    }

    private static string Field(string[] fields, int index)
        => index < fields.Length ? fields[index].Trim() : string.Empty;

    private static string? FieldOrNull(string[] fields, int index)
        => string.IsNullOrWhiteSpace(Field(fields, index)) ? null : Field(fields, index);
}