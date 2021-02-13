# ExtractTest

We need to create a script in order to find words in a page
starting or ending with a given prefix/suffix.

```bash
./script.sh [url] [start|end] [word]
```

For instance if we run:

```bash
./script.sh https://github.com/OVNICap/ExtractTest start Extra
```

We expect the following output:

```
[ExtractTest]
```

Each different word should be displayed on a new line and
between squared brackets. Such as:
```bash
./script.sh https://fr.wikipedia.org/wiki/CentOS end OS
```

Will return:
```
[CentOS]
[ClearOS]
[SteamOS]
```

In normal cases the program should exit with the code `0`.

In case of the following errors, it should exit with `1`:
- If the URL does not start with `http:` or `https:`, display `Invalid URL`
- If the command (second argument) is neither `start` nor `end`, display `Invalid command`

### Testing

To check your script against specification, run:

```bash
./tests/tester.sh
```

Or use the GitHub Actions on your fork or on a pull-request
here.
