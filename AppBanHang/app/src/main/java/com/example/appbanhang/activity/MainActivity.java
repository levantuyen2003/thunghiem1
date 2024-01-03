package com.example.appbanhang.activity;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.bumptech.glide.Glide;
import com.example.appbanhang.R;
import com.example.appbanhang.adapter.LoaiSpAdapter;
import com.example.appbanhang.adapter.SanPhamMoiAdapter;
import com.example.appbanhang.model.LoaiSp;
import com.example.appbanhang.model.SanPhamMoi;
import com.example.appbanhang.model.SanPhamMoiModel;
import com.example.appbanhang.model.User;
import com.example.appbanhang.retrofit.ApiBanHang;
import com.example.appbanhang.retrofit.RetrofitClient;
import com.example.appbanhang.utils.Utils;
import com.google.android.material.navigation.NavigationView;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.paperdb.Paper;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {
    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewManHinhChinh;
    NavigationView navigationView;
    ListView listViewManHinhChinh;
    DrawerLayout drawerLayout;
    LoaiSpAdapter loaiSpAdapter;
    List<LoaiSp> mangloaisp;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    List<SanPhamMoi> mangSpMoi;
    SanPhamMoiAdapter spAdapter;
    NotificationBadge badge;
    FrameLayout frameLayout;
    ImageView imgsearch;


    @Override
    //khai bao pt không có kiểu trả về
    protected void onCreate(Bundle savedInstanceState) {
        //lệnh gọi pt oncreate cua lop cha va truyền tham số savedInstanceState
        super.onCreate(savedInstanceState);
        //gán gd ng dùng cho activity-main.xml
        setContentView(R.layout.activity_main);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        //khởi tạo đối tượng lưu trữ
        Paper.init(this);
        //điêuù kiện kiểm tra xem paper có tồn tại hay không
        if (Paper.book().read("user") != null){
            //khai báo và gán giá trị cho user
            User user = Paper.book().read("user");
            //gán giá trị cho 1 biến cho tên user_current
            Utils.user_current = user;
        }

        Anhxa(); //gọi các view
        ActionBar(); // thiết lập thanh công cụ

        if (isConnected(this)){ //kiểm tra kết nối mạng

            ActionViewFlipper();
            getLoaiSanPham();
            getSpMoi();
            chonItemlistview();

        }else {
            Toast.makeText(getApplicationContext(),"Không có Internet, vui lòng kết nối",Toast.LENGTH_LONG).show();
        }
    }
    // Khai báo một phương thức riêng tên là chonItemlistview không có tham số
    private void chonItemlistview() {
        // Thiết lập một OnItemClickListener cho đối tượng listViewManHinhChinh, là một thể hiện của lớp AdapterView
        listViewManHinhChinh.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            // Sử dụng chú thích @Override để chỉ ra rằng phương thức này ghi đè một phương thức trong lớp cha
            @Override
            // Định nghĩa phương thức onItemClick có bốn tham số: một đối tượng AdapterView, một đối tượng View, một giá trị int và một giá trị long
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                switch (i){
                    // Sử dụng một câu lệnh switch để thực hiện các hành động khác nhau dựa trên giá trị của i, là vị trí của mục được nhấp trong danh sách
                    case 0:
                        // Nếu i là 0, thực hiện khối code sau
                        Intent intent=new Intent(MainActivity.this,MainActivity.class);
                        // Tạo một đối tượng Intent mới tên là intent chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp MainActivity là điểm đến
                        startActivity(intent);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng intent

                        break;
                        // Thoát khỏi câu lệnh switch
                    case 1:
                        // Nếu i là 1, thực hiện khối code sau
                        Intent dienthoai=new Intent(MainActivity.this, DienThoaiActivity.class);
                        // Tạo một đối tượng Intent mới tên là dienthoai chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp DienThoaiActivity là điểm đến
                        dienthoai.putExtra("loai",1);
                        // Thêm một dữ liệu bổ sung tên là "loai" với giá trị 1 vào đối tượng dienthoai
                        startActivity(dienthoai);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng dienthoai
                        break;
                        // Thoát khỏi câu lệnh switch
                    case 2:
                        // Nếu i là 2, thực hiện khối code sau
                        Intent laptop=new Intent(MainActivity.this, LaptopActivity.class);
                        // Tạo một đối tượng Intent mới tên là laptop chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp LaptopActivity là điểm đến
                        laptop.putExtra("loai",2);
                        // Thêm một dữ liệu bổ sung tên là "loai" với giá trị 2 vào đối tượng laptop
                        startActivity(laptop);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng laptop
                        break;
                        // Thoát khỏi câu lệnh switch
                    case 3:
                        // Nếu i là 3, thực hiện khối code sau
                        Intent thongtin =new Intent(MainActivity.this, ThongTinActivity.class);
                        // Tạo một đối tượng Intent mới tên là thongtin chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp ThongTinActivity là điểm đến
                        startActivity(thongtin);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng thongtin
                        break;
                        // Thoát khỏi câu lệnh switch
                    case 4:
                        // Nếu i là 4, thực hiện khối code sau
                        Intent lienhe =new Intent(MainActivity.this, LienHeActivity.class);
                        // Tạo một đối tượng Intent mới tên là lienhe chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp LienHeActivity là điểm đến
                        startActivity(lienhe);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng lienhe
                        break;
                        // Thoát khỏi câu lệnh switch
                    case 5:
                        // Nếu i là 5, thực hiện khối code sau
                        Intent donhang=new Intent(MainActivity.this, XemDonHangActivity.class);
                        // Tạo một đối tượng Intent mới tên là donhang chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp XemDonHangActivity là điểm đến
                        startActivity(donhang);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng donhang
                        break;
                        // Thoát khỏi câu lệnh switch
                    case 6:
                        // Nếu i là 6, thực hiện khối code sau
                        //Xóa key user
                        Paper.book().delete("user");
                        // Sử dụng thư viện Paper để xóa key "user" khỏi bộ nhớ cục bộ
                        Intent dangnhap =new Intent(MainActivity.this, DangNhapActivity.class);
                        // Tạo một đối tượng Intent mới tên là dangnhap chỉ định hoạt động hiện tại (MainActivity) là ngữ cảnh và lớp DangNhapActivity là điểm đến
                        startActivity(dangnhap);
                        // Bắt đầu hoạt động được chỉ định bởi đối tượng dangnhap
                        finish();
                        // Kết thúc hoạt động hiện tại (MainActivity)
                        break;
                        // Thoát khỏi câu lệnh switch
                }
            }
        });
    }



    private void getSpMoi() {
        // Khai báo một phương thức riêng tên là getSpMoi không có tham số
        compositeDisposable.add(apiBanHang.getSpMoi()
                // Thêm một đối tượng Observable trả về từ phương thức getSpMoi của đối tượng apiBanHang vào đối tượng compositeDisposable
                .subscribeOn(Schedulers.io())
                // Chỉ định rằng Observable sẽ được đăng ký trên một luồng IO
                .observeOn(AndroidSchedulers.mainThread())
                // Chỉ định rằng các hành động sẽ được thực hiện trên luồng chính của Android
                .subscribe(
                        // Đăng ký một người quan sát để nhận các sự kiện từ Observable
                        sanPhamMoiModel -> {
                            // Định nghĩa hành động khi nhận được một đối tượng sanPhamMoiModel từ Observable
                            if (sanPhamMoiModel.isSuccess()){
                                // Kiểm tra xem đối tượng sanPhamMoiModel có thành công hay không
                                mangSpMoi = sanPhamMoiModel.getResult();
                                // Gán giá trị trả về từ phương thức getResult của đối tượng sanPhamMoiModel cho biến mangSpMoi
                                spAdapter = new SanPhamMoiAdapter(getApplicationContext(), mangSpMoi);
                                // Tạo một đối tượng SanPhamMoiAdapter mới với ngữ cảnh ứng dụng và biến mangSpMoi làm tham số
                                recyclerViewManHinhChinh.setAdapter(spAdapter);
                                // Thiết lập đối tượng spAdapter làm bộ điều hợp cho đối tượng recyclerViewManHinhChinh

                            }

                        },
                        throwable -> {
                            // Định nghĩa hành động khi xảy ra lỗi từ Observable
                            Toast.makeText(getApplicationContext(),"Không kết nối được server" + throwable.getMessage(),Toast.LENGTH_LONG).show();
                            // Hiển thị một thông báo Toast với nội dung "Không kết nối được server" cộng với thông điệp lỗi từ đối tượng throwable, và thời gian hiển thị là Toast.LENGTH_LONG
                        }

                ));
    }

    private void getLoaiSanPham() {
        // Khai báo một phương thức riêng tên là getLoaiSanPham không có tham số
        compositeDisposable.add(apiBanHang.getLoaiSp()
                // Thêm một đối tượng Observable trả về từ phương thức getLoaiSp của đối tượng apiBanHang vào đối tượng compositeDisposable
                .subscribeOn(Schedulers.io())
                // Chỉ định rằng Observable sẽ được đăng ký trên một luồng IO
                .observeOn(AndroidSchedulers.mainThread())
                // Chỉ định rằng các hành động sẽ được thực hiện trên luồng chính của Android
                .subscribe(
                        // Đăng ký một người quan sát để nhận các sự kiện từ Observable
                        loaiSpModel -> {
                            // Định nghĩa hành động khi nhận được một đối tượng loaiSpModel từ Observable
                            Log.d("h",loaiSpModel.getResult().get(0).getTensanpham() );
                            // In ra tên sản phẩm đầu tiên trong kết quả của đối tượng loaiSpModel với tag "h"
                            Toast.makeText(getApplicationContext(), loaiSpModel.getResult().get(0).getTensanpham(), Toast.LENGTH_SHORT).show(); // Hiển thị một thông báo Toast với nội dung là tên sản phẩm đầu tiên trong kết quả của đối tượng loaiSpModel, và thời gian hiển thị là Toast.LENGTH_SHORT
                            if (loaiSpModel.isSuccess()){
                                // Kiểm tra xem đối tượng loaiSpModel có thành công hay không

                                mangloaisp = loaiSpModel.getResult();
                                // Gán giá trị trả về từ phương thức getResult của đối tượng loaiSpModel cho biến mangloaisp
                                mangloaisp.add(new LoaiSp("Đăng xuất","https://tse1.mm.bing.net/th?id=OIP.YYdy7rUi0LH3aQ_gjvHjTgHaHa&pid=Api&P=0"));
                                // Thêm một đối tượng LoaiSp mới với tên là "Đăng xuất" và hình ảnh là một URL vào biến mangloaisp
                                //khoi tao adapter
                                loaiSpAdapter = new LoaiSpAdapter(getApplicationContext(),mangloaisp);
                                // Tạo một đối tượng LoaiSpAdapter mới với ngữ cảnh ứng dụng và biến mangloaisp làm tham số
                                listViewManHinhChinh.setAdapter(loaiSpAdapter);
                                // Thiết lập đối tượng loaiSpAdapter làm bộ điều hợp cho đối tượng listViewManHinhChinh
                            }
                        }
                ));

    }


    private void ActionViewFlipper() {
        List<String> mangquangcao = new ArrayList<>();
        mangquangcao.add("https://tse1.mm.bing.net/th?id=OIP.ijzug9CVI8MPKnxAo_vu2AHaE7&pid=Api&P=0");
        mangquangcao.add("https://tse2.mm.bing.net/th?id=OIP.w5vx2h_fpvCClgS1WOtiVwHaE_&pid=Api&P=0");
        mangquangcao.add("https://tse3.mm.bing.net/th?id=OIP.bUQTAnTuHM7n5oxCVGUilQHaFB&pid=Api&P=0");
        for (int i = 0; i < mangquangcao.size(); i++){
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(mangquangcao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation slide_in = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_in_right);
        Animation slide_out = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_out_rigth);
        viewFlipper.setInAnimation(slide_in);
        viewFlipper.setOutAnimation(slide_out);
    }

    private void ActionBar(){
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    private void Anhxa() {
        imgsearch = findViewById(R.id.imgsearch);
        toolbar = findViewById(R.id.toobarmanhinhchinh);
        viewFlipper = findViewById(R.id.viewlipper);
        recyclerViewManHinhChinh = findViewById(R.id.recycleview);
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this, 2);
        recyclerViewManHinhChinh.setLayoutManager(layoutManager);
        recyclerViewManHinhChinh.setHasFixedSize(true);
        listViewManHinhChinh = findViewById(R.id.listviewmanhinhchinh);
        navigationView = findViewById(R.id.navigationview);
        drawerLayout = findViewById(R.id.drawerlayout);
        badge = findViewById(R.id.menu_sl);
        frameLayout = findViewById(R.id.framegiohang);
        //khoi tao list
        mangloaisp = new ArrayList<>();
        mangSpMoi = new ArrayList<>();
        if (Paper.book().read("giohang") != null) {
            Utils.manggiohang = Paper.book().read("giohang");
        }
        if (Utils.manggiohang == null) {
            Utils.manggiohang = new ArrayList<>();

        }else {
            int totalItem = 0;
            for (int i = 0; i < Utils.manggiohang.size(); i++){
                totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
            }
            badge.setText(String.valueOf(totalItem));
        }
        frameLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
                startActivity(giohang);
            }
        });
        imgsearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), SearchActivity.class);
                startActivity(intent);
            }
        });

    }

    @Override
    protected void onResume() {
        super.onResume();
        int totalItem = 0;
        for (int i = 0; i < Utils.manggiohang.size(); i++){
            totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
        }
        badge.setText(String.valueOf(totalItem));
    }

    private boolean isConnected (Context context){
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        NetworkInfo moblie = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        if ((wifi != null && wifi.isConnected()) || (moblie != null && moblie.isConnected()) ){
            return true;
        }else{
            return false;
        }
    }
    @Override
    protected void onDestroy(){
        compositeDisposable.clear();
        super.onDestroy();
    }
}