Design a browser history simulation.

Implement BrowserHistory:
- BrowserHistory(string homepage)   starts on homepage
- void Visit(string url)            visits url, clearing forward history
- string Back(int steps)            goes back up to steps pages, returns current url
- string Forward(int steps)         goes forward up to steps pages, returns current url

Restrictions:
- Use two stacks (back and forward)
- Do not use LINQ