function yp = resampleFDZP(y, m) 
%   FREQUENCY-DOMAIN ZERO-PADDING (FDZP) RESAMPLING (INTERPOLATION)
%
%   Syntax:    
%       yp = resampleFDZP(y, m)
%
%   Input: 
%         y = input signal to be resampled (y must be a row vector)
%
%         m = resampling factor (e.g., if y is 100 sps and yp will be
%                                    200 sps, then m is 200/100 = 2)
%        yp = resampled signal
%
%
%   The method is based on the procedure given in p. 779 of Lyons (2011).
%
%   Lyons, R.G. (2014). Understanding Digital Signal Processing, Prentice
%   Hall, 3rd ed.
%
%   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER "AS IS" AND ANY
%   EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
%   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER BE LIABLE
%   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
%   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
%   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
%   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
%   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
%   Written by Dr. Erol Kalkan, P.E. (ekalkan@usgs.gov)
%   $Revision: 2.0 $  $Date: 2016/08/31 13:03:00 $
%
% Calculate number of padding zeros
padlen = length(y)*(m - 1);

% Compute number of half points in FFT 
zlen = ceil((length(y)+1)/2);

% Compute FFT
z = fft(y);

% Construct a new spectrum (row vector) by centering zeros
zp = [z(1:zlen) zeros(1, padlen) z(zlen+1:end)];

if  ~mod(length(y), 2); % even number
    zp(zlen) = zp(zlen)/2; zp(zlen+padlen) = zp(zlen);
end

% Compute inverse FFT and scale by m
yp = real(ifft(zp))*m; 

