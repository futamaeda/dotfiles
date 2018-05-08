" �iTODO: ���̂���Kaoriya����̕����폜����j
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (���̍s�Ɋւ��Ă�:help modeline���Q��)
"
" An example for a Japanese version vimrc file.
" ���{��ł̃f�t�H���g�ݒ�t�@�C��(vimrc) - Vim 7.4
"
" Last Change: 07-May-2018.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" ���:
" ���̃t�@�C���ɂ�Vim�̋N�����ɕK���ݒ肳���A�ҏW���̋����Ɋւ���ݒ肪��
" ����Ă��܂��BGUI�Ɋւ���ݒ��gvimrc�ɏ�������Ă��܂��B
"
" �l�p�ݒ��_vimrc�Ƃ����t�@�C�����쐬�������ōs�Ȃ��܂��B_vimrc�͂��̃t�@
" �C���̌�ɓǍ��܂�邽�߁A�����ɏ����ꂽ���e���㏑�����Đݒ肷�邱�Ƃ��o��
" �܂��B_vimrc��$HOME�܂���$VIM�ɒu���Ă����K�v������܂��B$HOME��$VIM����
" �D�悳��A$HOME�ł݂������ꍇ$VIM�͓Ǎ��܂�܂���B
"
" �Ǘ��Ҍ����ɖ{�ݒ�t�@�C���𒼐ڏ����������ɍς܂��邱�Ƃ�ړI�Ƃ��āA�T�C
" �g���[�J���Ȑݒ��ʃt�@�C���ōs�Ȃ���悤�ɔz�����Ă���܂��BVim�N������
" �T�C�g���[�J���Ȑݒ�t�@�C��($VIM/vimrc_local.vim)�����݂���Ȃ�΁A�{�ݒ�
" �t�@�C���̎�v�������ǂݍ��܂��O�Ɏ����I�ɓǂݍ��݂܂��B
"
" �ǂݍ��݌�A�ϐ�g:vimrc_local_finish����0�̒l�ɐݒ肳��Ă����ꍇ�ɂ͖{��
" ��t�@�C���ɏ����ꂽ���e�͈�؎��s����܂���B�f�t�H���g�����S�č����ւ�
" �����ꍇ�ɗ��p���ĉ������B
"
" �Q�l:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" �T�C�g���[�J���Ȑݒ�($VIM/vimrc_local.vim)������Γǂݍ��ށB�ǂݍ��񂾌��
" �ϐ�g:vimrc_local_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�
" �t�@�C���̓Ǎ��𒆎~����B
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ���[�U�D��ݒ�($HOME/.vimrc_first.vim)������Γǂݍ��ށB�ǂݍ��񂾌�ɕϐ�
" g:vimrc_first_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�t�@
" �C���̓Ǎ��𒆎~����B
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins���̃f�B���N�g����runtimepath�֒ǉ�����B
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

"---------------------------------------------------------------------------
" ���{��Ή��̂��߂̐ݒ�:
"
" �t�@�C����Ǎ��ގ��Ƀg���C���镶���G���R�[�h�̏������m�肷��B�����R�[�h��
" �����ʋ@�\�𗘗p����ꍇ�ɂ͕ʓriconv.dll���K�v�Biconv.dll�ɂ��Ă�
" README_w32j.txt���Q�ƁB���[�e�B���e�B�X�N���v�g��ǂݍ��ނ��ƂŐݒ肳���B
source $VIM/plugins/kaoriya/encode_japan.vim
" ���b�Z�[�W����{��ɂ��� (Windows�ł͎����I�ɔ��f�E�ݒ肳��Ă���)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS X���j���[�̓��{�ꉻ (���j���[�\���O�ɍs�Ȃ��K�v������)
if has('mac')
  set langmenu=japanese
endif
" ���{����͗p��keymap�̐ݒ�� (�R�����g�A�E�g)
if has('keymap')
  " ���[�}��������keymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" ��GUI���{��R���\�[�����g���Ă���ꍇ�̐ݒ�
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" ���j���[�t�@�C�������݂��Ȃ��ꍇ�͗\��'guioptions'�𒲐����Ă���
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram���̒񋟂���ݒ����C���N���[�h (�ʃt�@�C��:vimrc_example.vim)�B����
" �ȑO��g:no_vimrc_example�ɔ�0�Ȓl��ݒ肵�Ă����΃C���N���[�h�͂��Ȃ��B
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vim��ǂݍ��ގ���guioptions��M�t���O�����āAsyntax on
    " ��filetype plugin on�������N����menu.vim�̓ǂݍ��݂������B�������Ȃ�
    " ��enc�ɑΉ����郁�j���[�t�@�C�����ǂݍ��܂�Ă��܂��A����̌�œǂݍ�
    " �܂��.vimrc��enc���ݒ肳�ꂽ�ꍇ�ɂ��̐ݒ肪���f���ꂸ���j���[������
    " �����Ă��܂��B
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" �����̋����Ɋւ���ݒ�:
"
" �������ɑ啶���������𖳎� (noignorecase:�������Ȃ�)
set ignorecase
" �啶���������̗������܂܂�Ă���ꍇ�͑啶�������������
set smartcase

"---------------------------------------------------------------------------
" �ҏW�Ɋւ���ݒ�:
"
" �^�u�̉�ʏ�ł̕� ��2
set tabstop=2
" �^�u���X�y�[�X�ɓW�J���Ȃ� (expandtab:�W�J����) ������ɕύX
set expandtab
" �����I�ɃC���f���g���� (noautoindent:�C���f���g���Ȃ�)
set autoindent
" �I�[�g�C���f���g���ɃC���f���g���镶���� ���i�����Œǉ��j
set shiftwidth=2
" { ������Ǝ����ŃC���f���g��[�����Ă���� ���i�����Œǉ��j
set smartindent
"�����̘A�������󔒂�1��ō폜�ł���悤�ɂ��邩 ���i�����Œǉ� �K�v�Ȃ��\������j
set softtabstop=2 
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set showmatch
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
set wildmenu
" �e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI�ŗL�ł͂Ȃ���ʕ\���̐ݒ�:
"
" �s�ԍ����\�� (number:�\��) ���\���ɕύX
set number
" ���[���[��\�� (noruler:��\��)
set ruler
" �^�u����s��\�� (list:�\��)
set nolist
" �ǂ̕����Ń^�u����s��\�����邩��ݒ�
"set listchars=tab:>-,extends:<,trail:-,eol:<
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)
set wrap
" ��ɃX�e�[�^�X�s��\�� (�ڍׂ�:he laststatus)
set laststatus=2
" �R�}���h���C���̍��� (Windows�pgvim�g�p����gvimrc��ҏW���邱��)
set cmdheight=2
" �R�}���h���X�e�[�^�X�s�ɕ\��
set showcmd
" �^�C�g����\��
set title
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme evening " (Windows�pgvim�g�p����gvimrc��ҏW���邱��)

"---------------------------------------------------------------------------
" �t�@�C������Ɋւ���ݒ�:
"
" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"set nobackup

" �o�b�N�A�b�v��C�̌�����Ƃ����
set backupdir=C:/VimTemp
set undodir=C:/VimTemp
set directory=C:/VimTemp


"---------------------------------------------------------------------------
" �t�@�C�����ɑ啶���������̋�ʂ��Ȃ��V�X�e���p�̐ݒ�:
"   (��: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tags�t�@�C���̏d���h�~
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" �R���\�[���ł̃J���[�\���̂��߂̐ݒ�(�b��I��UNIX��p)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" �R���\�[���łŊ��ϐ�$DISPLAY���ݒ肳��Ă���ƋN�����x���Ȃ錏�֑Ή�
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" �v���b�g�z�[���ˑ��̓��ʂȐݒ�

" Win�ł�PATH��$VIM���܂܂�Ă��Ȃ��Ƃ���exe�������o���Ȃ��̂ŏC��
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Mac�ł̓f�t�H���g��'iskeyword'��cp932�ɑΉ�������Ă��Ȃ��̂ŏC��
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYa�Ńo���h�����Ă���v���O�C���̂��߂̐ݒ�

" autofmt: ���{�ꕶ�͂̃t�H�[�}�b�g(�܂�Ԃ�)�v���O�C��.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: ���{��w���v�𖳌�������.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" vimproc: ������vimproc�𖳌�������
if kaoriya#switch#enabled('disable-vimproc')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
endif

" go-extra: ������ vim-go-extra �𖳌�������
if kaoriya#switch#enabled('disable-go-extra')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]golang$"'), ',')
endif


" Copyright (C) 2009-2016 KaoriYa/MURAOKA Taro




"�������玩����



"�r�[�v���폜
set vb t_vb=

"�����f�t�H���g��S��10�i���ɂ���
set nrformats=

"Esc�̊��蓖�ĕύX
" �}�����[�h��jj�ł��G�X�P�[�v�A���ł�<C-j>�ŃG�X�P�[�v  map <C-j> <esc> map! <C-j> <esc>����Ȃ�����OK?  �Ȃ����R�}���h���C�����[�h�ł�<CR>���Ԃ��Ă���̂�cnoremap��ǉ�����Ɓcinoremap <C-j> <esc> cmap <C-j> <esc> �Ƃ��Ă��_���������̂ŕ��u
" ������inoremap�ł͈ړ�(����)
inoremap <silent> jj <ESC>
"noremap <C-j> <esc>
"noremap! <C-j> <esc>


" ���̂ւ�R�s�yhttps://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b
" (���������܂������ĂȂ��̂�����)
"
" ���̓��[�h�ł̃J�[�\���ړ�
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"Vim�ł�<C-S->���������s�炵���B
"��(�����A-h���f�t�H���g�̃w���v�Ƃ��Ԃ����Ⴄ�̂�)
inoremap <A-j> <Bs>
inoremap <A-k> <Del>


" ���{����͂��I���̂܂܂ł��g����R�}���h(Enter�L�[�͕K�v)
nnoremap �� a
nnoremap �� i
nnoremap �� u
nnoremap �� o
nnoremap ��d dd
nnoremap ���� dd
nnoremap ��y yy
nnoremap ���� yy

" ���{����͂Łh��j�h�Ɠ��͂��Ă�Enter�L�[�Ŋm�肳����΃C���T�[�g���[�h�𔲂���
inoremap <silent> ��j <ESC>
inoremap <silent> ���� <ESC>




"�C���f���g���� ���@�悭�킩���̂ŉ�����
"filetype indent on  

"�������W�X�^�ɓ���f�[�^���N���b�v�{�[�h(*���W�X�^)�Ɂ@���@
set clipboard+=unnamed 

"�m�[�}�����[�h�ƃ��B�W���A�����[�h�� ; �� : �̊��蓖�Ă��t�ɂ���B
noremap ; :
noremap : ;

"�����Â炢����X�y�[�X�ƕ����ĉ����₷������B
noremap <Space>h  ^
noremap <Space>l  $
noremap <Space>m  %


""���Hvim��������

"�R�}���h���C����ł̏㉺�����Ƃ��ǂ�
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"���݃f�B���N�g����%%�ŕ\��byTIP41  �Ȃ񂩂��܂������ĂȂ�����
cnoremap <expr> %% getcmdtype () == ':' ? expand('%:h').'/' : '%%'

"n��N�ňړ��Z�k? ����Ȃ����� Leader���f�t�H���g����\�Ȃ̂ł����Â炻��
noremap <Leader>n nzz  
noremap <Leader>N Nzz

"�C���N�������^���T�[�`����
set incsearch

":nohlsearch��<C-l>�łł���悤��
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

"F4�L�[��paste��؂�ւ���B
set pastetoggle=<F4>

"F5�L�[��tags�t�@�C���X�V
"nnoremap <F5> :!ctags -R<CR>
"����������A�����̕����H
"autocmd BufWritePost * call system("ctags -R")
"�������߂̓R�~�b�g���邽�сA�Ȃ̂ł܂����x�B

"���B�W���A�����[�h�őI�����������������Bvim-visual-star-search�Ɠ������Ƃ�������B����������"s���W�X�^�g�����Ⴄ�́H
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"vimgrep����quickfix���X�g����������X�g�Ɉ�������R�}���h
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"&�����Œ��O�̒u�����J��Ԃ��}�b�s���O�@
nnoremap & :&&<CR>  
xnoremap & :&&<CR> 

"netrw�Ƃ������v���O�C���g������
set nocompatible
filetype plugin on
"runtime macros/matchit.vim    "matchit.vim���g����悤��(�܂��f�B���N�g������ĂȂ�)


"���݂���̃p�N��
" �R�s�[
" --------------------------------------------------------------------------------
"nnoremap Y Vy
nnoremap Y ^v$hy

" �ړ�
" --------------------------------------------------------------------------------
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k
