// Turns a test status from the nightly report into one summary line.
// Rewrite the if / else if chain as a switch. The output must not change.

let status = "failed"

if status == "passed" {
    print("PASS")
} else if status == "failed" {
    print("FAIL - open the report")
} else if status == "skipped" || status == "disabled" {
    print("NOT RUN")
} else {
    print("UNKNOWN status: \(status)")
}
