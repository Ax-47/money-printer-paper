# Dockerfile สำหรับคอมไพล์เอกสาร LaTeX (CS KKU Project) ด้วย XeLaTeX
FROM texlive/texlive:latest

# ติดตั้งฟอนต์ภาษาไทยและยูทิลิตี้พื้นฐานเพิ่มเติม
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-thai-tlwg \
    make \
    ghostscript \
    && rm -rf /var/lib/apt/lists/*

# ตั้ง working directory สำหรับโปรเจกต์
WORKDIR /workspace

# คำสั่งเริ่มต้น: คอมไพล์เอกสาร main.tex ด้วย latexmk (อ้างอิงค่าจาก .latexmkrc)
CMD ["latexmk", "main.tex"]
