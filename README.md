# Realtek ASIO Driver

This project provides a standalone installer for the official Realtek ASIO driver, extracted from a larger driver package. This is intended to simplify the installation process for users who need the ASIO driver without the full package.

## About

The Realtek ASIO driver is essential for users engaged in audio production and editing, offering low-latency performance. This repository does **not** modify or own the original files; it only hosts the ASIO driver separately for convenience. The driver was originally distributed by Realtek through OEMs like Dell, HP, Lenovo, and Asus.

## Installation

1. Download the latest release from the [Releases page](https://github.com/samuelcaldas/Realtek-ASIO-Driver/releases).
2. Extract the ZIP file.
3. Navigate to the `ASIO` folder.
4. Run `Install.exe` as Administrator.
5. Restart your DAW or audio application.

## Uninstalling

Since `Install.exe` does not bundle a dedicated uninstaller, use one of the following methods:

### Option 1 — Dedicated uninstaller (recommended)

Use the [RealtekASIOInstaller by KeppySoftware](https://github.com/KeppySoftware/RealtekASIOInstaller), which includes a proper uninstall option.

### Option 2 — Automated uninstall script

Run the `uninstall.bat` script included in the `ASIO` folder of this repository as Administrator. It will remove the ASIO driver registration from the Windows Driver Store.

### Option 3 — DriverStoreExplorer

1. Download [DriverStoreExplorer (Rapr)](https://github.com/lostindark/DriverStoreExplorer).
2. Search for `realtekasio.inf`.
3. Select it and click **Force Delete**.

### Option 4 — Control Panel

Go to **Control Panel → Programs → Uninstall a program**, find the Realtek ASIO entry and uninstall from there.

> **Note:** Removing the main Realtek HD Audio driver from Device Manager will **not** remove the ASIO component. It registers separately and must be removed using one of the methods above.

## File Integrity

All files in the `/ASIO` folder are unmodified binaries extracted directly from official OEM driver packages (Dell, HP, Lenovo, Asus). SHA256 checksums are provided in [`checksums.txt`](checksums.txt) for independent verification.

To verify on Windows (PowerShell):
```powershell
Get-FileHash .\ASIO\RTHDASIO64.dll -Algorithm SHA256
```

To verify on Linux:
```bash
sha256sum ASIO/RTHDASIO64.dll
```

## Updates

I am not able to update the driver files themselves since they are managed by Realtek. However, if an updated version is released, I will include it in this repository. Please check back periodically or contribute updates if you find new versions.

### Community-tested variants

The package in this repository is a standalone extraction for easy installation. Community reports in the issue tracker also mention newer extracted variants:

- `RealtekASIO_13` — latest stable recommendation for most users.
- `RealtekASIO_9` — recommended when multichannel mapping is required.
- `RealtekASIO_14` (`RTHDASIO64.dll` `3.1.14.3`) — reported as potentially unstable.

Community backup archive: <https://drive.google.com/drive/folders/1mXJ62HJFlSj5qCO9qf3mTx0v9tyWN5vT>

> If you contribute newer files, please include provenance (OEM package name/version or Windows Update Catalog package ID) so source history can be documented in releases.

## Contributing

If you come across a newer version of the Realtek ASIO driver, please let me know by opening an issue in the **[Issues tab](https://github.com/samuelcaldas/Realtek-ASIO-Driver/issues)**. Contributions are welcome to help keep this project up-to-date.

## Related Projects

- [RealtekASIOInstaller by KeppySoftware](https://github.com/KeppySoftware/RealtekASIOInstaller) — A dedicated installer/uninstaller for Realtek ASIO with a graphical interface.
- [DriverStoreExplorer (Rapr)](https://github.com/lostindark/DriverStoreExplorer) — Useful for force-removing drivers from the Windows Driver Store.

## Disclaimer

This project is **not** affiliated with Realtek or any OEMs like Dell, HP, Lenovo, or Asus. The original driver files are the property of Realtek, and this repository is simply a repackaging for user convenience. Use at your own risk.

## License

This project is provided under the MIT [License](LICENSE). Note that this license applies to the code in this repository, not to the actual driver files.
