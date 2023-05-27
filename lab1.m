function varargout = lab1(varargin)
% LAB1 MATLAB code for lab1.fig
%      LAB1, by itself, creates a new LAB1 or raises the existing
%      singleton*.
%
%      H = LAB1 returns the handle to a new LAB1 or the handle to
%      the existing singleton*.
%
%      LAB1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB1.M with the given input arguments.
%
%      LAB1('Property','Value',...) creates a new LAB1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab1

% Last Modified by GUIDE v2.5 27-May-2023 21:40:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab1_OpeningFcn, ...
                   'gui_OutputFcn',  @lab1_OutputFcn, ...
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


% --- Executes just before lab1 is made visible.
function lab1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab1 (see VARARGIN)

% Choose default command line output for lab1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[file path]=uigetfile('*.jpg');
img=imread([path file]);
axes(handles.axes1);
imshow(img);

% --- Executes on button press in Split.
function Split_Callback(hObject, eventdata, handles)
% hObject    handle to Split (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[r c l]=size(img);
img1=img(1:r/2, 1:c/2, :);
img2=img(1:r/2, c/2:c, :);
img3=img(r/2:r, 1:c/2, :);
img4=img(r/2:r, c/2:c, :);
axes(handles.axes2), imshow(img1);
axes(handles.axes3), imshow(img3);
axes(handles.axes4), imshow(img4);
axes(handles.axes5), imshow(img2);
