function varargout = ProcesamientoDeImagenes(varargin)
% PROCESAMIENTODEIMAGENES M-file for ProcesamientoDeImagenes.fig
%      PROCESAMIENTODEIMAGENES, by itself, creates a new PROCESAMIENTODEIMAGENES or raises the existing
%      singleton*.
%
%      H = PROCESAMIENTODEIMAGENES returns the handle to a new PROCESAMIENTODEIMAGENES or the handle to
%      the existing singleton*.
%
%      PROCESAMIENTODEIMAGENES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESAMIENTODEIMAGENES.M with the given input arguments.
%
%      PROCESAMIENTODEIMAGENES('Property','Value',...) creates a new PROCESAMIENTODEIMAGENES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProcesamientoDeImagenes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProcesamientoDeImagenes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProcesamientoDeImagenes

% Last Modified by GUIDE v2.5 26-Nov-2013 22:11:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProcesamientoDeImagenes_OpeningFcn, ...
                   'gui_OutputFcn',  @ProcesamientoDeImagenes_OutputFcn, ...
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


% --- Executes just before ProcesamientoDeImagenes is made visible.
function ProcesamientoDeImagenes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProcesamientoDeImagenes (see VARARGIN)

% Choose default command line output for ProcesamientoDeImagenes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProcesamientoDeImagenes wait for user response (see UIRESUME)
% uiwait(handles.prodeimg);


% --- Outputs from this function are returned to the command line.
function varargout = ProcesamientoDeImagenes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Elegir.
function Elegir_Callback(hObject, eventdata, handles)
% hObject    handle to Elegir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nombre dire] = uigetfile('*.jpg','Abrir');
if nombre == 0
    return
end
global imagen;
global grises;
global final;
global selec;
imagen = imread(fullfile(dire,nombre));
axes(handles.foto)
imshow(imagen)
[x,y,z]=size(imagen);
switch z
    case 3
        grises = double(rgb2gray(imagen));
    case 1
        grises = double(imagen);
    otherwise
        disp('Error en la imagen');
        grises = [];
end
axes(handles.byn)
imshow(grises/255)
[a,b]=size(grises);
if a ~= 0
    set(handles.Opciones,'Enable','on');
    set(handles.Aplicar,'Enable','on');
    set(handles.Opciones,'Value',1);
    set(handles.Umbral,'Enable','On');
    set(handles.Umbral,'String','1');
    set(handles.Tam,'String','3');
    selec = 1;
    final = binarizar(grises,1);
end

% --- Executes on selection change in Opciones.
function Opciones_Callback(hObject, eventdata, handles)
% hObject    handle to Opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Opciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Opciones
global imagen;
global grises;
global selec;
[z,y,z]=size(imagen);
if z==3
    axes(handles.foto)
    imshow(imagen)
end
if z==1
    axes(handles.foto)
    imshow(imagen)
end
axes(handles.byn)
imshow(grises/255)
selec = get(hObject,'Value');
set(handles.Umbral,'Enable','off');
set(handles.Blanco,'Enable','off');
set(handles.Negro,'Enable','off');
set(handles.Tam,'Enable','off');
set(handles.EE1,'Enable','off');
set(handles.EE2,'Enable','off');
set(handles.EE3,'Enable','off');
set(handles.EE4,'Enable','off');
set(handles.EE5,'Enable','off');
set(handles.EE6,'Enable','off');
set(handles.EE7,'Enable','off');
set(handles.EE8,'Enable','off');
set(handles.EE9,'Enable','off');
set(handles.R1,'Enable','off');
set(handles.R2,'Enable','off');
set(handles.R3,'Enable','off');
if selec == 1
    set(handles.Umbral,'Enable','on');
end
if selec == 9
    set(handles.EE1,'Enable','on');
    set(handles.EE2,'Enable','on');
    set(handles.EE3,'Enable','on');
    set(handles.EE4,'Enable','on');
    set(handles.EE5,'Enable','on');
    set(handles.EE6,'Enable','on');
    set(handles.EE7,'Enable','on');
    set(handles.EE8,'Enable','on');
    set(handles.EE9,'Enable','on');
end
if (selec >=10 && selec <=12)
    set(handles.Tam,'Enable','on');
end
if (selec >= 9 && selec <=14)
    set(handles.Blanco,'Enable','on');
    set(handles.Negro,'Enable','on');
end
if (selec >=15 && selec <=22)
    set(handles.R1,'Enable','on');
end
if (selec >=17 && selec <=22)
    set(handles.R2,'Enable','on');
end
if (selec >=21 && selec <=22)
    set(handles.R3,'Enable','on');
end

% --- Executes during object creation, after setting all properties.
function Opciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Aplicar.
function Aplicar_Callback(hObject, eventdata, handles)
% hObject    handle to Aplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen;
global selec;
global grises;
global final;
finalant = final;
final =[];
switch selec
    case 1 %Binarizar
        n = str2num(get(handles.Umbral,'String'));
        final = binarizar(grises,n);
    case 2 %Obtener negativo
        final = negativo(grises);
    case 3 %Girar Derecha
        final = girarder(grises);
    case 4 %Girar Izquierda
        final = girarizq(grises);
    case 5 %Girar 180
        final = girar180(grises);
    case 6 %Espejo Horizontal
        final = reflejarh(grises);
    case 7 %Espejo Vertical
        final = reflejarv(grises);
    case 8 %Histograma
        S = histograma(limitarvalores(round(grises)));
        x = 0:255;
        plot(handles.procesada,x,S)
        final = finalant;
    case 9 %Filtro (3x3)
        fondo = get(handles.Blanco,'Value');
        EE(1,1) = str2double(get(handles.EE1,'String'));
        EE(1,2) = str2double(get(handles.EE2,'String'));
        EE(1,3) = str2double(get(handles.EE3,'String'));
        EE(2,1) = str2double(get(handles.EE4,'String'));
        EE(2,2) = str2double(get(handles.EE5,'String'));
        EE(2,3) = str2double(get(handles.EE6,'String'));
        EE(3,1) = str2double(get(handles.EE7,'String'));
        EE(3,2) = str2double(get(handles.EE8,'String'));
        EE(3,3) = str2double(get(handles.EE9,'String'));
        final = filtro3x3(grises,EE,fondo);
    case 10 %Filtro maximo
        fondo = get(handles.Blanco,'Value');
        n = str2num(get(handles.Tam,'String'));
        final = filtromax(grises,n,fondo);
    case 11 %Filtro minimo
        fondo = get(handles.Blanco,'Value');
        n = str2num(get(handles.Tam,'String'));
        final = filtromin(grises,n,fondo);
    case 12 %Filtro promedio
        fondo = get(handles.Blanco,'Value');
        n = str2num(get(handles.Tam,'String'));
        final = filtro1(grises,n,fondo);
    case 13 %Filtro prewitt
        fondo = get(handles.Blanco,'Value');
        final = prewitt(grises,fondo);
    case 14 %Filtro Sobel
        fondo = get(handles.Blanco,'Value');
        final = sobel(grises,fondo);
    case 15 %Filtro FFT - Pasa Bajas - Ideal
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        fr = fft2(grises);
        f = fftshift(fr);        
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        cir = (sqrt(u.^2+v.^2)<R1)*1;
        set(handles.cir,'Visible','on');
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 16 %Filtro FFT - Pasa Altas - Ideal
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        cir = (sqrt(u.^2+v.^2)>R1)*1;
        set(handles.cir,'Visible','on');
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 17 %Filtro FFT - Pasa Banda - Ideal
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        cir = (sqrt(u.^2+v.^2)<R1)*1 + (sqrt(u.^2+v.^2)>R2)*1 - ones(size(u));
        set(handles.cir,'Visible','on');
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 18 %Filtro FFT - Rechaza Banda - Ideal
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        cir = (sqrt(u.^2+v.^2)>R1)*1 + (sqrt(u.^2+v.^2)<R2)*1;
        set(handles.cir,'Visible','on');
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 19 %Filtro FFT - Pasa Bajas - Real
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        n=101; % Número de escalones
        k=linspace(R2,R1,n);
        cir = zeros(size(grises));
        for i=1:n-1
            cir = ((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + cir;
        end
        cir = (sqrt(u.^2+v.^2)<R2)*1 + cir;
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 20 %Filtro FFT - Pasa Altas - Real
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        n=101; % Número de escalones
        k=linspace(R2,R1,n);
        cir = zeros(size(grises));
        for i=1:n-1
            cir = ((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + cir;
        end
        cir = (sqrt(u.^2+v.^2)<R2)*1 + cir;
        cir = 1 - cir;
        axes(handles.cir)
        meshc(u,v,cir)
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 21 %Filtro FFT - Pasa Banda - Real
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        R3 = str2num(get(handles.R3,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        n=101; % Número de escalones
        k=linspace(R2,R1,n);
        k2=linspace(R3,R2,n);
        temp = zeros(size(grises));
        temp2 = zeros(size(grises));
        for i=1:n-1
            temp = ((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + temp;
            temp2 = ((sqrt(u.^2+v.^2)>=k2(i))*1 + (sqrt(u.^2+v.^2)<k2(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + temp2;
        end
        temp2 = 1 - (sqrt(u.^2+v.^2)<R3)*1 - temp2;
        cir = (sqrt(u.^2+v.^2)<R2).* temp2 + temp;
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 22 %Filtro FFT - Rechaza Banda - Real
        axes(handles.foto)
        imshow(grises/255)
        R1 = str2num(get(handles.R1,'String'));
        R2 = str2num(get(handles.R2,'String'));
        R3 = str2num(get(handles.R3,'String'));
        fr = fft2(grises);
        f = fftshift(fr);
        axes(handles.byn)
        imshow(log(abs(f)),[])
        [u,v] = freqspace(size(fr),'meshgrid');
        n=101; % Número de escalones
        k=linspace(R2,R1,n);
        k2=linspace(R3,R2,n);
        temp = zeros(size(grises));
        temp2 = zeros(size(grises));
        for i=1:n-1
            temp = ((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + temp;
            temp2 = ((sqrt(u.^2+v.^2)>=k2(i))*1 + (sqrt(u.^2+v.^2)<k2(i+1))*1 - ones(size(u)))*(n-i)/(n-1) + temp2;
        end
        temp2 = 1 - (sqrt(u.^2+v.^2)<R3)*1 - temp2;
        cir = (sqrt(u.^2+v.^2)<R2).* temp2 + temp;
        cir = 1 - cir;
        final = limitarvalores(round(abs(ifft2(ifftshift(f.*cir)))));
    case 23 %Ampliacion (x2)
        final = ampliarx2(grises);
    case 24 %Reduccion (x2)
        final = reducirx2(grises);
    case 25 %Ocultar Imagen
        [nombre dire] = uigetfile('*.jpg','Abrir');
        if nombre == 0
            return
        end
        imagen = imread(fullfile(dire,nombre));
        [x,y,z]=size(imagen);
        switch z
            case 3
                oculta = double(rgb2gray(imagen));
            case 1
                oculta = double(imagen);
            otherwise
                disp('Error en la imagen');
                oculta = [];
        end
        axes(handles.foto)
        imshow(grises/255)
        axes(handles.byn)
        imshow(oculta/255)
        final = ocultar(grises,oculta);
    case 26 %Mostrar Imagen oculta
        final = mostrar(grises);
    case 27 %Obtener Rojo
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,1) = imagen(1:x,1:y,1);
        end
        if (z==1)
            final(1:x,1:y,1) = imagen;
        end
    case 28 %Obtener Verde
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,2) = imagen(1:x,1:y,2);
        end
        if (z==1)
            final(1:x,1:y,2) = imagen;
        end        
    case 29 %Obtener Azul
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,3) = imagen(1:x,1:y,3);
        end
        if (z==1)
            final(1:x,1:y,3) = imagen;
        end
    case 30 %Obtener Ceylan
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,2:3) = imagen(1:x,1:y,2:3);
        end
        if (z==1)
            final(1:x,1:y,2) = imagen;
            final(1:x,1:y,3) = imagen;
        end
    case 31 %Obtener Magenta
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,[1,3]) = imagen(1:x,1:y,[1,3]);
        end
        if (z==1)
            final(1:x,1:y,1) = imagen;
            final(1:x,1:y,3) = imagen;
        end
    case 32 %Obtener Amarillo
        [x,y,z]=size(imagen);
        final=zeros(x,y,3);
        if (z==3)
            final(1:x,1:y,1:2) = imagen(1:x,1:y,1:2);
        end
        if (z==1)
            final(1:x,1:y,1) = imagen;
            final(1:x,1:y,2) = imagen;
        end
    otherwise
        disp('Error en selec');
end
if selec == 8
    set(handles.Nueva,'Enable','off');
    set(handles.Guardar,'Enable','off');
else
    set(handles.Nueva,'Enable','on');
    set(handles.Guardar,'Enable','on');
    axes(handles.procesada)
    imshow(final/255)
end

% --- Executes on button press in Nueva.
function Nueva_Callback(hObject, eventdata, handles)
% hObject    handle to Nueva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen;
global final;
global grises;
global selec;
selec = 1;
[x,y,z]=size(final);
if (z==1)
    imagen = zeros(x,y,3);
    imagen(1:x,1:y,1) = final;
    imagen(1:x,1:y,2) = final;
    imagen(1:x,1:y,3) = final;
    imagen=uint8(imagen);
    grises = final;
end
if (z==3)
    imagen = uint8(final);
    grises = double(rgb2gray(uint8(imagen)));    
end
axes(handles.foto)
imshow(imagen)
axes(handles.byn)
imshow(grises/255)
set(handles.Opciones,'Value',1);
set(handles.Tam,'String','3');
set(handles.Umbral,'String','1');
set(handles.Umbral,'Enable','On');
final = binarizar(grises,1);

% --- Executes on button press in Guardar.
function Guardar_Callback(hObject, eventdata, handles)
% hObject    handle to Guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global final;
nom = get(handles.Nombre,'String');
nom = strcat(nom,'.jpg');
imwrite(final/255,nom);

% --- Executes during object creation, after setting all properties.
function Nombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in color1.
function color1_Callback(hObject, eventdata, handles)
% hObject    handle to color1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of color1



function Umbral_Callback(hObject, eventdata, handles)
% hObject    handle to Umbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Umbral as text
%        str2double(get(hObject,'String')) returns contents of Umbral as a double
n=round(str2num(get(hObject,'String')));
if n<=1
    n=1;
end
if n>255
    n=255;
end
[a,b]=size(n);
if a == 0
    n=1;
end
set(hObject,'String',num2str(n));
    
% --- Executes during object creation, after setting all properties.
function Umbral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Umbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tam_Callback(hObject, eventdata, handles)
% hObject    handle to Tam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tam as text
%        str2double(get(hObject,'String')) returns contents of Tam as a double
n=round(str2num(get(hObject,'String')));
if n<=3
    n=3;
end
[a,b]=size(n);
if a == 0
    n=3;
end
set(hObject,'String',num2str(n));

% --- Executes during object creation, after setting all properties.
function Tam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE1_Callback(hObject, eventdata, handles)
% hObject    handle to EE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE1 as text
%        str2double(get(hObject,'String')) returns contents of EE1 as a double


% --- Executes during object creation, after setting all properties.
function EE1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE2_Callback(hObject, eventdata, handles)
% hObject    handle to EE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE2 as text
%        str2double(get(hObject,'String')) returns contents of EE2 as a double


% --- Executes during object creation, after setting all properties.
function EE2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE3_Callback(hObject, eventdata, handles)
% hObject    handle to EE3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE3 as text
%        str2double(get(hObject,'String')) returns contents of EE3 as a double


% --- Executes during object creation, after setting all properties.
function EE3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE4_Callback(hObject, eventdata, handles)
% hObject    handle to EE4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE4 as text
%        str2double(get(hObject,'String')) returns contents of EE4 as a double


% --- Executes during object creation, after setting all properties.
function EE4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE5_Callback(hObject, eventdata, handles)
% hObject    handle to EE5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE5 as text
%        str2double(get(hObject,'String')) returns contents of EE5 as a double


% --- Executes during object creation, after setting all properties.
function EE5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE6_Callback(hObject, eventdata, handles)
% hObject    handle to EE6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE6 as text
%        str2double(get(hObject,'String')) returns contents of EE6 as a double


% --- Executes during object creation, after setting all properties.
function EE6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE7_Callback(hObject, eventdata, handles)
% hObject    handle to EE7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE7 as text
%        str2double(get(hObject,'String')) returns contents of EE7 as a double


% --- Executes during object creation, after setting all properties.
function EE7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE8_Callback(hObject, eventdata, handles)
% hObject    handle to EE8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE8 as text
%        str2double(get(hObject,'String')) returns contents of EE8 as a double


% --- Executes during object creation, after setting all properties.
function EE8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EE9_Callback(hObject, eventdata, handles)
% hObject    handle to EE9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EE9 as text
%        str2double(get(hObject,'String')) returns contents of EE9 as a double


% --- Executes during object creation, after setting all properties.
function EE9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EE9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nombre_Callback(hObject, eventdata, handles)
% hObject    handle to Nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nombre as text
%        str2double(get(hObject,'String')) returns contents of Nombre as a double
nom = get(hObject,'String');
[a,b]=size(nom);
if b == 0
    set(hObject,'String','Imagen');
end


% --- Executes during object creation, after setting all properties.
function UPIITA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UPIITA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img = imread('upiita.jpg');
axes(hObject)
imshow(img)
% Hint: place code in OpeningFcn to populate UPIITA


% --- Executes during object creation, after setting all properties.
function IPN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IPN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img = imread('ipn.jpg');
axes(hObject)
imshow(img)
% Hint: place code in OpeningFcn to populate IPN



function R1_Callback(hObject, eventdata, handles)
% hObject    handle to R1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R1 as text
%        str2double(get(hObject,'String')) returns contents of R1 as a double
n=str2num(get(hObject,'String'));
if n>=1
    n=1;
end
if n<=0
    n=0;
end
[a,b]=size(n);
if a == 0
    n=0.9;
end
set(hObject,'String',num2str(n));

% --- Executes during object creation, after setting all properties.
function R1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R2_Callback(hObject, eventdata, handles)
% hObject    handle to R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R2 as text
%        str2double(get(hObject,'String')) returns contents of R2 as a double
n=str2num(get(hObject,'String'));
if n>=1
    n=1;
end
if n<=0
    n=0;
end
[a,b]=size(n);
if a == 0
    n=0.8;
end
set(hObject,'String',num2str(n));

% --- Executes during object creation, after setting all properties.
function R2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R3_Callback(hObject, eventdata, handles)
% hObject    handle to R3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R3 as text
%        str2double(get(hObject,'String')) returns contents of R3 as a double
n=str2num(get(hObject,'String'));
if n>=1
    n=1;
end
if n<=0
    n=0;
end
[a,b]=size(n);
if a == 0
    n=0.7;
end
set(hObject,'String',num2str(n));

% --- Executes during object creation, after setting all properties.
function R3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Elegir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Elegir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Aplicar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
