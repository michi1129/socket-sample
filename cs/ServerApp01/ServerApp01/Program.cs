using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Net;
using System.Net.Sockets;

namespace ServerApp01
{
    class Program
    {
        static void Main(string[] args)
        {
            StartServer();
        }

        static string ServerIPAddress = "192.168.22.108";
        static int ServerPortNo = 15555;

        static Socket listener_;

        static void StartServer()
        {
            try
            {
                OpenListener();

                Socket socket = null;
                while ((socket = listener_.Accept()) != null)
                {
                    //Console.Write("accepted.");
                    byte[] buf = new byte[256];
                    int bufSize = socket.Receive(buf, buf.Length, SocketFlags.None);

                    string received = Encoding.UTF8.GetString(buf, 0, bufSize);
                    Console.WriteLine(string.Format(" {0} [{1}] {2}", DateTime.Now.ToString("hh:MM:ss"), bufSize, received));
                }
            }
            catch (SocketException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                CloseListener();
            }
        }

        static void OpenListener()
        {
            IPAddress ip = IPAddress.Parse(ServerIPAddress);
            IPHostEntry host = Dns.GetHostEntry(ip);
            int port = ServerPortNo;

            IPEndPoint endPoint = new IPEndPoint(ip, port);
            listener_ = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            listener_.Bind(endPoint);

            Console.WriteLine("listening...");
            listener_.Listen(3);
        }

        static void CloseListener()
        {
            if (listener_ != null)
            {
                //listener_.Shutdown(SocketShutdown.Receive);
                listener_.Close();
            }
        }
    }
}
