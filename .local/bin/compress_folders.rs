#!/usr/bin/env run-cargo-script

//! ```cargo
//! [dependencies]
//!
//! glob = "0.3.0"
//! tar =  "0.4.38"
//! flate2 = "1.0.25"
//!
//! ```

extern crate flate2;
extern crate glob;
extern crate tar;

use flate2::read::GzDecoder;
use flate2::write::GzEncoder;
use flate2::Compression;
use glob::glob;
use std::env;
use std::fs::File;
use tar::Archive;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() == 1 {
        println!("compress_folders <command> <file_path>");
    } else if args[1] == "compress" {
        _ = compress();
        println!("Compression Completed");
    } else if args[1] == "decompress" {
        _ = decompress();
        println!("Decompression Completed");
    }
}

fn decompress() -> Result<(), std::io::Error> {
    let args: Vec<String> = env::args().collect();
    for entry in glob(format!("{}/**/*.tar.gz", args[1]).as_str()).unwrap() {
        // println!("{}", entry.unwrap().display());

        let path = entry.unwrap().display().to_string();

        let tar_gz = File::open(path)?;
        let tar = GzDecoder::new(tar_gz);
        let mut archive = Archive::new(tar);
        archive.unpack(".")?;
    }

    Ok(())
}

fn compress() -> Result<(), std::io::Error> {
    let args: Vec<String> = env::args().collect();
    println!("Compressing:");
    for entry in glob(format!("{}/**/*/", args[2]).as_str()).unwrap() {
        // let filename_ref = entry.unwrap().display();
        // println!("{}", &entry,unwrap().display());
        let tar_gz =
            File::create([entry.unwrap().display().to_string(), ".tar.gz".to_string()].join(""))?;
        let enc = GzEncoder::new(tar_gz, Compression::default());
        let mut tar = tar::Builder::new(enc);
        tar.append_dir_all(".", ".")?;
    }

    Ok(())
}

// #[cfg(test)]
// mod test {
//     use super::*;
//
//     #[test]
//     fn simple_test() {
//         assert_eq!(4, 4);
//     }
// }
