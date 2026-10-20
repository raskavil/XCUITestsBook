// Turns a test status from the nightly report into one summary line.
// Rewrite the if / else if chain as a switch. The output must not change.

let status = "failed"

switch status {
case "passed":
    print("PASS")
case "failed":
    print("FAIL - open the report")
case "skipped", "disabled":
    print("NOT RUN")
default:
    print("UNKNOWN status: \(status)")
}
