#!/bin/bash

# Daftar nama file yang akan dibuat
FILES=("keygen" "ganti" "jalan")

# Konten spesifik untuk setiap file
CONTENT=(
    "#!/bin/bash\n\nbash -c \"$(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/keygen.sh)\""
    "#!/bin/bash\n\nbash -c \"$(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/ganti.sh)\""
    "#!/bin/bash\n\nbash -c \"$(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/jalan.sh)\""
)

# Membuat file satu per satu
for i in "${!FILES[@]}"; do
    FILE_NAME="${FILES[$i]}"
    FILE_CONTENT="${CONTENT[$i]}"

    # Cek apakah file sudah ada
    if [ -f "$FILE_NAME" ]; then
        echo "File $FILE_NAME sudah ada."
        continue
    fi

    # Isi dari file baru
    echo -e "$FILE_CONTENT" > "$FILE_NAME"

    # Memberikan izin eksekusi ke file baru
    chmod +x "$FILE_NAME"

    # Konfirmasi kepada pengguna
    echo "File $FILE_NAME berhasil dibuat dan diberi izin eksekusi."
done
