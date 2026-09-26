// This program writes its own source code into Grace_kid.rs.
macro_rules! kid { () => { "Grace_kid.rs" }; }
macro_rules! src { () => { "// This program writes its own source code into Grace_kid.rs.\nmacro_rules! kid { () => { \"Grace_kid.rs\" }; }\nmacro_rules! src { () => { @ }; }\nmacro_rules! ft { () => { fn main() { let s = src!(); if std::fs::write(kid!(), s.replacen(\"@\", &format!(\"{:?}\", s), 1)).is_err() { std::process::exit(1); } } }; }\nft!();\n" }; }
macro_rules! ft { () => { fn main() { let s = src!(); if std::fs::write(kid!(), s.replacen("@", &format!("{:?}", s), 1)).is_err() { std::process::exit(1); } } }; }
ft!();
