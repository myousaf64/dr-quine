// This program prints its own source code.

fn main() {
    // The string below holds the whole program.
    let s = "// This program prints its own source code.\n\nfn main() {\n    // The string below holds the whole program.\n    let s = @;\n    print_source(s);\n}\n\nfn print_source(s: &str) {\n    print!(\"{}\", s.replacen(\"@\", &format!(\"{:?}\", s), 1));\n}\n";
    print_source(s);
}

fn print_source(s: &str) {
    print!("{}", s.replacen("@", &format!("{:?}", s), 1));
}
