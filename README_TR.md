# CTSA: Deb Kuralları ile Geliştirilmiş Kısıtlı Ağaç-Tohum Algoritması

Bu depo, **Deb kurallarını** kullanarak kısıtlı optimizasyon problemlerini çözmek üzere geliştirilmiş **Kısıtlı Ağaç-Tohum Algoritması (CTSA)**’nın resmi MATLAB kodlarını içermektedir.

> Ahmet Babalik, Ahmet Cevahir Cinar, Mustafa Servet Kiran,  
> *A modification of tree-seed algorithm using Deb’s rules for constrained optimization*,  
> Applied Soft Computing, Cilt 63, 2018, Sayfa 289–305.  
> DOI: [https://doi.org/10.1016/j.asoc.2017.10.013](https://doi.org/10.1016/j.asoc.2017.10.013)

## 🌲 Algoritma Özeti

CTSA, özgün TSA’nın (Ağaç-Tohum Algoritması) kısıtlı problemlere uygulanabilmesi için Deb kuralları ile yeniden düzenlenmiş halidir. Deb kuralları, amaç fonksiyonu ve kısıt ihlallerini değerlendirerek bir sonraki nesilde hayatta kalacak bireyleri belirlemeye yarar.

Temel özellikler:
- Penaltı fonksiyonu kullanılmaz
- Kısıtlı problemleri Deb kuralları ile çözer
- **13 benchmark problemi** (maksimizasyon ve minimizasyon)
- Karşılaştırma yapılan algoritmalar: PSO, ABC, GA, DE ve literatürdeki diğer güçlü yöntemler

## 📁 Klasör Yapısı

- `run_DebTSA.m`: CTSA algoritmasının ana yürütme dosyası
- `output/`: Çözüm kalitesi, yakınsama ve kısıt ihlali analizleri

## 🛠 Gereksinimler

- MATLAB R2015b veya üzeri
- Herhangi bir ek toolbox gerektirmez

## 📌 Atıf

Akademik çalışmalarda lütfen şu yayına atıfta bulunun:

```bibtex
@article{babalik2018ctsa,
  title = {A modification of tree-seed algorithm using Deb’s rules for constrained optimization},
  author = {Babalik, Ahmet and Cinar, Ahmet Cevahir and Kiran, Mustafa Servet},
  journal = {Applied Soft Computing},
  volume = {63},
  pages = {289--305},
  year = {2018},
  issn = {1568-4946},
  doi = {10.1016/j.asoc.2017.10.013},
  url = {https://www.sciencedirect.com/science/article/pii/S156849461730618X}
}
```

## 🤝 İletişim ve İş Birliği

📧 E-posta: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
