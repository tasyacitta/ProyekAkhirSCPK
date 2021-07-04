function varargout = D_GUI_123190086_123190090(varargin)
% D_GUI_123190086_123190090 MATLAB code for D_GUI_123190086_123190090.fig
%      D_GUI_123190086_123190090, by itself, creates a new D_GUI_123190086_123190090 or raises the existing
%      singleton*.
%
%      H = D_GUI_123190086_123190090 returns the handle to a new D_GUI_123190086_123190090 or the handle to
%      the existing singleton*.
%
%      D_GUI_123190086_123190090('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in D_GUI_123190086_123190090.M with the given input arguments.
%
%      D_GUI_123190086_123190090('Property','Value',...) creates a new D_GUI_123190086_123190090 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before D_GUI_123190086_123190090_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to D_GUI_123190086_123190090_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help D_GUI_123190086_123190090

% Last Modified by GUIDE v2.5 27-Jun-2021 16:57:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @D_GUI_123190086_123190090_OpeningFcn, ...
                   'gui_OutputFcn',  @D_GUI_123190086_123190090_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before D_GUI_123190086_123190090 is made visible.
function D_GUI_123190086_123190090_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to D_GUI_123190086_123190090 (see VARARGIN)

% Choose default command line output for D_GUI_123190086_123190090
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes D_GUI_123190086_123190090 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = D_GUI_123190086_123190090_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA WARGA.xlsx');
opts.SelectedVariableNames = [2];
y = readmatrix('DATA WARGA.xlsx',opts);
opts = detectImportOptions('DATA WARGA.xlsx');
opts.SelectedVariableNames = [3,4,5,6,7];
opts.DataRange='2:25';
x = readmatrix('DATA WARGA.xlsx',opts);
k=[0,1,1,0,0];%nilai atribut, dimana 0= atribut biaya &1= atribut keuntungan
w=[0.15,0.15,0.20,0.18,0.32];% bobot untuk masing-masing kriteria
%tahapan 1. normalisasi matriks
[m n]=size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y=zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n,
 if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
  R(:,j)=x(:,j)./max(x(:,j));
 else
  R(:,j)=min(x(:,j))./x(:,j);
 end;
end;
%tahapan kedua, proses perangkingan
for i=1:m,
 V(i)= sum(w.*R(i,:)); %mencari nilai hasil
end;
[poin no]=sort(V,'descend'); %mengurutkan data berdasarkan nilai terbesar
%poin adalah nilai dari hasil perhitungan
%no adalah nomor urut data
%melakukan invers untuk 20 data teratas

    poin1=poin(:,1:5); %menyimpan hasil perhitungan
    poin2=no(:,1:5); %menyimpan nomor rumah yang sesuai kriteria
    
    poin3=[poin2;poin1];
    set(handles.tableHasil,'data',(poin3).'); %menampilkan ranking keluarga penerima bansos berdasarkan kesesuaian


% --- Executes on button press in lihatData.
function lihatData_Callback(hObject, eventdata, handles)
% hObject    handle to lihatData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA WARGA.xlsx');
opts.SelectedVariableNames = [1 3:7];
opt = detectImportOptions('DATA WARGA.xlsx');
opt.SelectedVariableNames = [2];
data = readmatrix('DATA WARGA.xlsx',opt);
data1 = readmatrix('DATA WARGA.xlsx',opts);
set(handles.tableNama,'data',data);
set(handles.tableData,'data',data1);
