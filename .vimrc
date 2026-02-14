let skip_defaults_vim=1

set mouse=v

set viminfo=""

" отключить совместимость с vi
set nocompatible

" " посдветка синтаксиса
syntax enable

" включить отображение номеров строк
set number

" кодировка файлов
set encoding=utf-8
set termencoding=utf-8

" показывать первую парную скобку после ввода второй
set showmatch

" отключаем создание swp файлов
set noswapfile

filetype plugin indent on

" показывать строку статуса всегда
set laststatus=2

" использовать больше цветов в терминале
set t_Co=256

" включаем подсветку выражения, которое ищется в текст
set hlsearch

" eсли искомое выражения содержит символы в верхнем регистре — ищет с учётом регистра, иначе — без учёта
set smartcase

" игнорировать регистр букв при поиске
set ignorecase

" инкрементальный поиск
set incsearch

" размер табуляции в пробелах
set tabstop=4

" ширина 'мягкого' таба
set softtabstop=4

" размер сдвига при нажатии на кнопки < >
set shiftwidth=4

" преобразовывать табуляцию в пробелы
set expandtab

" комбинация Ctrl+\ открывает определение под курсором в новой вкладке (при использовании ctags)
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" заменяет клавишу ESC для выхода из режима вставки на jj (двойное нажатие j)
:inoremap jj <ESC>
