use std::process::Command;

fn main() {
    let mut i = 5;
    let s = "use std::process::Command;\n\nfn main() {\n    let mut i = #;\n    let s = @;\n    if file!().contains(\"Sully_\") {\n        i -= 1;\n    }\n    if i < 0 {\n        return;\n    }\n    let name = format!(\"Sully_{}\", i);\n    let code = s.replacen(\"#\", &i.to_string(), 1).replacen(\"@\", &format!(\"{:?}\", s), 1);\n    if std::fs::write(format!(\"{}.rs\", name), code).is_err() {\n        std::process::exit(1);\n    }\n    let cmd = format!(\"rustc {0}.rs -o {0} && ./{0}\", name);\n    match Command::new(\"sh\").arg(\"-c\").arg(cmd).status() {\n        Ok(st) if st.success() => {}\n        _ => std::process::exit(1),\n    }\n}\n";
    if file!().contains("Sully_") {
        i -= 1;
    }
    if i < 0 {
        return;
    }
    let name = format!("Sully_{}", i);
    let code = s.replacen("#", &i.to_string(), 1).replacen("@", &format!("{:?}", s), 1);
    if std::fs::write(format!("{}.rs", name), code).is_err() {
        std::process::exit(1);
    }
    let cmd = format!("rustc {0}.rs -o {0} && ./{0}", name);
    match Command::new("sh").arg("-c").arg(cmd).status() {
        Ok(st) if st.success() => {}
        _ => std::process::exit(1),
    }
}
