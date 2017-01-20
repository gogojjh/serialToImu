/*
 * 每次都需要把chmod 666 ttyUSB0
 * 每1s只能获取到约97Hz的数据
*/

/*
 * 	#include <sys/time.h>
	struct timeval tv;
	struct timezone tz;
	gettimeofday(&tv, &tz);
	cout << tv.tv_sec << endl; 时间戳, 返回当前距离1970年的秒数和微妙数
 */



#define PORT "/dev/ttyUSB0"
#define NCC 32

#include <stdio.h>          //标准输入输出定义
#include <stdlib.h>         //标准函数库定义
#include <unistd.h>        //Unix 标准函数定义
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>          //文件控制定义
#include <termios.h>    //PPSIX 终端控制定义
#include <errno.h>        //错误号定义
#include <string.h>
#include <time.h>
#include <iostream>
#include <fstream>
#include <ctime>
#include <sys/time.h>

using namespace std;

float accl[3], angv[3], ang[3], Temp;
ofstream imuData("../imuData.txt"); // imu数据文件存储
time_t started, ended, duration; // 时间戳, 以s为单位
struct timeval tv;
struct timezone tz;;

/**
*@brief                     initial the serial
*@param  fd             which serial
*@param  speed      speed of serial
*@return  void
*/
int speed_arr[] = { B300, B600, B1200, B2400, B4800, B9600, B19200, B38400, B57600, B115200};
int name_arr[] = { 300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200};

void Set_serial(int fd, int speed)
{
        int i;
        int status;
        struct termios opt;
        tcgetattr(fd, &opt);
        for ( i=0; i < sizeof(speed_arr) / sizeof(int); i++)
        {
                tcflush(fd, TCIOFLUSH);
                cfsetispeed(&opt, speed_arr[i]);    //speed_arr[i]Bps
                cfsetospeed(&opt, speed_arr[i]);
                status = tcsetattr(fd, TCSANOW, &opt);
                if (status != 0)
                {
                        perror("tcsetattr fd !");
                        return;
                }
                tcflush(fd, TCIOFLUSH);
        }
}

void DecodeIMUData(unsigned char *reTemp)
{
	ended = time(nullptr);
	duration = ended - started; 
	gettimeofday(&tv, &tz);
        if(reTemp[0]==0x55)      //检查帧头
        {
            switch(reTemp[1])
            {
                   case 0x51:
                       accl[0] = (short(reTemp [3]<<8| reTemp [2]))/32768.0*16;
                       accl[1] = (short(reTemp [5]<<8| reTemp [4]))/32768.0*16;
                       accl[2] = (short(reTemp [7]<<8| reTemp [6]))/32768.0*16;
                       Temp = (short(reTemp [9]<<8| reTemp [8]))/340.0+36.25;
                       cout << "Acceleration x y z " << accl[0] << " " << accl[1] << " " << accl[2] <<  " Temperature " << Temp << endl;
		       imuData << "Timetable(s)" << tv.tv_sec << " Acceleration x y z: " << accl[0] << " " << accl[1] << " " << accl[2] <<  " Temperature:" << Temp << endl;
                       break;
                   case 0x52:
                       angv[0] = (short(reTemp [3]<<8| reTemp [2]))/32768.0*2000;
                       angv[1] = (short(reTemp [5]<<8| reTemp [4]))/32768.0*2000;
                       angv[2] = (short(reTemp [7]<<8| reTemp [6]))/32768.0*2000;
                       Temp = (short(reTemp [9]<<8| reTemp [8]))/340.0+36.25;
                       cout << "Angular velocity x y z " << angv[0] << " " << angv[1] << " " << angv[2] <<  " Temperature: " << Temp << endl;
		       imuData << "Timetable(s)" << tv.tv_sec << " Angular velocity x y z: " << angv[0] << " " << angv[1] << " " << angv[2] <<  " Temperature: " << Temp << endl;
                       break;
                   case 0x53:
                       ang[0] = (short(reTemp [3]<<8| reTemp [2]))/32768.0*180;
                       ang[1] = (short(reTemp [5]<<8| reTemp [4]))/32768.0*180;
                       ang[2] = (short(reTemp [7]<<8| reTemp [6]))/32768.0*180;
                       Temp = (short(reTemp [9]<<8| reTemp [8]))/340.0+36.25;
                       cout << "Angle x y z: " << ang[0] << " " << ang[1] << " " << ang[2] <<  " Temperature: " << Temp << endl;
		       imuData << "Timetable(s)" << tv.tv_sec << " Angle x y z: " << ang[0] << " " << ang[1] << " " << ang[2] <<  " Temperature: " << Temp << endl;
                       break;
            }
        }
}

int main()
{
        int fd;
        fd = open(PORT, O_RDWR);
        if (fd ==-1)
        {
                perror("Can not Open Serial Port !");
                return 0;
        }
        Set_serial(fd, 115200); // 串口波特率

        char reBuf[50];
        unsigned char reTemp[11];
        int head = 0, end = 0; //head/end of the data
        started = time(nullptr);
        while (true)
        {
                head = 0;
		end = read(fd, reBuf, 1); // 不断读数据直到读到帧头0x55
                if (end == 0) continue;
		if (reBuf[0]==0x55) 
		{		
			end = read(fd, &reBuf[1], 32); // 读取完整的数据帧, 长度=33-1(帧头)
			while ((end - head + 1) >= 11)
			{
				for (int i = 0; i <= 10; i++) reTemp[i] = reBuf[i+head];
				if (!((reTemp[0] == 0x55) & ((reTemp[1] == 0x51) | (reTemp[1] == 0x52) | (reTemp[1] == 0x53))))
				{
					head ++;
					continue;
				}
			        DecodeIMUData(reTemp);
				head += 11;
			}
		}
                usleep(10000); // 每隔10ms读取一次串口
        }
        imuData.close();
        close(fd);
}






















