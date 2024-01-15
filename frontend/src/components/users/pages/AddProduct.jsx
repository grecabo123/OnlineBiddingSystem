import axios from 'axios';
import { Button } from 'primereact/button'
import { Panel } from 'primereact/panel'
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useRef, useState } from 'react'
import { Link, useHistory } from 'react-router-dom/cjs/react-router-dom.min'
import swal from 'sweetalert';
import { InputText } from 'primereact/inputtext';
import { InputTextarea } from 'primereact/inputtextarea';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import { Toast } from 'primereact/toast';
import moment from 'moment';
import { InputNumber } from 'primereact/inputnumber';
import { Dialog } from 'primereact/dialog';
import ImportCSV from './ImportCSV';
import { PrimeIcons } from 'primereact/api';

function AddProduct() {


    const [ProductData, setProduct] = useState({
        productname: "",
        productdetails: "",
        address: "",
        youtube: "",
        error: [],
    });

    const [visible, setVisible] = useState(false);
    const [loading, setloading] = useState(true);
    const [barangaylist, setbarangay] = useState([]);
    const [date, setDate] = useState([])
    const [brgypick, setbrgypick] = useState("")
    const [TypeProductData, setTypeData] = useState([])
    const [value1, setValue1] = useState()
    const toast = useRef(null);
    const history = useHistory();
    const [PriceData, setPrice] = useState([]);
    const [btndis, setbtndis] = useState(false);
    const [startbit, setStart] = useState([]);
    const [endbit, setEnd] = useState([]);
    const [files, setFiles] = useState([]);
    const [details, setDetails] = useState([]);
    const [productid, setProductId] = useState();
    const [productloading, setloadingpro] = useState(true);

    useEffect(() => {
        axios.get(`/api/Muninicaplity`).then(res => {
            if (res.data.status === 200) {
                setbarangay(res.data.municipality);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);

    useEffect(() => {
        axios.get(`/api/PriceProduct`).then(res => {
            if (res.data.status === 200) {
                setPrice(res.data.data);
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);

    const handleInput = (e) => {
        e.persist();
        setProduct({ ...ProductData, [e.target.name]: e.target.value });
    }

    const handleFile = (e) => {
        e.persist();
        setFiles({ file: e.target.files[0] });
    }

    // console.log(files);

    const AddProductData = (e) => {
        e.preventDefault();
        setbtndis(true)
        const data = new FormData;

        data.append('productname', ProductData.productname);
        data.append('productdetails', ProductData.productdetails);
        // data.append('producttype', TypeProductData);
        data.append('producttype', productid);
        data.append('barangay', brgypick);
        data.append('youtube', ProductData.youtube);
        data.append('startbit', moment(startbit).format('MMM D YYYY '));
        data.append('endbit', moment(endbit).format("MMM D YYYY"));
        data.append('time_end', moment(endbit).format('hh:mm a'));
        data.append('num_days', moment(endbit).diff(startbit, 'days'));
        data.append('address', ProductData.address);
        data.append('user_logs', localStorage.getItem('auth_id'));
        data.append('files', files.file);


        axios.post(`/api/AddProducts`, data).then(res => {
            if (res.data.status === 200) {
                document.getElementById('reset_form').reset();
                toast.current.show({ severity: "success", summary: res.data.success, detail: "success" });
                setTypeData([])
                setbrgypick([])
                setValue1("");
                setbtndis(false)
            }
            else {
                setProduct({ ...ProductData, error: res.data.error });
                setbtndis(false)
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
                setbtndis(false)
            }
        })
    }

    const Brgydata = barangaylist.map((data) => {
        return (
            { label: data.municipality, value: data.id }
        )
    });

    const TypeProduct = PriceData.map((data) => {
        return (
            {
                label: data.product_name,
                value: data.id,
            }
        )
    });

    const onHide = () => {
        setVisible(false)
    }

    const getDataValue = (e) => {
        // console.log(e.target.value);
        // console.log(e.currentTarget.getAtribute('date_price'));
        setTypeData(e.value)

        axios.get(`/api/ProductFilter/${e.target.value}`).then(res => {
            if (res.data.status === 200) {
                setDetails(res.data.data)
                setProductId(res.data.data.id);
            }
            // console.log(res.data.data.id);
            setloadingpro(false);
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })


    }



    return (
        <div className='container-fluid p-3'>
            <Toast ref={toast} />
            <div className="row">
                <div className="col-lg-12">
                    <Panel header="Add Product">
                        {
                            loading ? <Skeleton></Skeleton>
                                :
                                <>
                                    <div className="d-flex justify-content-end">
                                        {/* <Link to="/user/product"><Button className='p-button-sm p-button-primary me-2' icon={PrimeIcons.LIST} label='List Bid' /></Link> */}
                                        {/* <Button className='p-button-sm p-button-success' label='Import CSV' onClick={(e) => setVisible(true)} /> */}
                                    </div>
                                    <div className="mt-3">
                                        <form onSubmit={AddProductData} id='reset_form' encType='multipart/form-data'>
                                            <div className="row">
                                                {/* <div className="col-lg-12 col-md-6 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        <span className='text-danger'>*</span>Product Name
                                                    </label>
                                                    <InputText className="w-100 p-inputtext-sm" onChange={handleInput} name='productname' />
                                                    <small className='text-danger'>{ProductData.error.productname}</small>
                                                </div> */}
                                                <div className="col-lg-12 col-md-6 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        <span className='text-danger'>*</span>Product Name
                                                    </label>
                                                    <Dropdown filter placeholder='Type of Product' className='w-100 p-inputtext-sm' value={TypeProductData} name='product_type' options={TypeProduct} onChange={getDataValue} />
                                                    <small className='text-danger'>{ProductData.error.producttype}</small>
                                                </div>
                                                {
                                                    productloading ? "" :
                                                        <>
                                                            <div className='col-lg-12 col-md-6 col-sm-12 mb-3'>
                                                                <label htmlFor="" className="form-label">
                                                                    Current Price
                                                                </label>
                                                                <InputText className='w-100' readOnly name='product_price' value={details.product_price} />
                                                            </div>
                                                            {/* <InputText  /> */}
                                                        </>
                                                }
                                                <div className="col-lg-12 col-md-6 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        <span className='text-danger'>*</span>Municipality
                                                    </label>
                                                    <Dropdown filter className='w-100 p-inputtext-sm' placeholder='Choose Municipality' value={brgypick} options={Brgydata} onChange={(e) => setbrgypick(e.target.value)} />
                                                    <small className='text-danger'>{ProductData.error.barangay}</small>
                                                </div>
                                                <div className="col-lg-12 col-md-6 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        <span className='text-danger'>*</span>Address
                                                    </label>
                                                    <InputText className="w-100 p-inputtext-sm" onChange={handleInput} name='address' />
                                                    <small className='text-danger'>{ProductData.error.address}</small>
                                                </div>
                                                <div className="col-lg-12 col-md-12 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        <span className='text-danger'>*</span>Remarks / Description
                                                    </label>
                                                    <InputTextarea className='w-100 p-inputtext-sm' onChange={handleInput} name='productdetails' rows={5} />
                                                    <small className='text-danger'>{ProductData.error.productdetails}</small>
                                                </div>
                                                <div className="col-lg-12 col-md-6 col-sm-12 mb-3">
                                                    <label htmlFor="Product Name" className="form-label">
                                                        Link Youtube
                                                    </label>
                                                    <InputText className="w-100 p-inputtext-sm" onChange={handleInput} name='youtube' />
                                                    <small className='text-danger'>{ProductData.error.youtube}</small>
                                                </div>
                                                <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                                    <label htmlFor="" className="form-label">
                                                        Upload Images
                                                    </label>
                                                    <InputText type='file'name='files' onChange={handleFile} className="w-100" />
                                                    {/* <small><span className='text-danger'>*</span>Upload atleast 5 images</small><br /> */}
                                                    <small><span className='text-danger'>{ProductData.error.files}</span></small>
                                                </div>
                                                <div className="col-lg-6 col-md-12 col-sm-12 mb-2">
                                                    <label htmlFor="" className="form-label">
                                                        <span className='text-danger'>*</span>Start Bid
                                                    </label>
                                                    <Calendar className='w-100 p-calendar' showTime={true} placeholder='Month Day Year ' onChange={(e) => setStart(e.target.value)} showIcon showButtonBar />
                                                    <small>
                                                        <span className='text-danger'>{ProductData.error.startbit}</span>

                                                    </small>
                                                </div>
                                                <div className="col-lg-6 col-md-12 col-sm-12 mb-2">
                                                    <label htmlFor="" className="form-label">
                                                        <span className='text-danger'>*</span>End Bid
                                                    </label>
                                                    <Calendar className='w-100 p-calendar' showTime={true} onChange={(e) => setEnd(e.target.value)} showIcon showButtonBar />
                                                    <small>
                                                        <span className='text-danger'>{ProductData.error.endbit}</span>

                                                    </small>
                                                </div>
                                            </div>
                                            <div className="mt-3">
                                                <Button className="p-button-sm p-button-info" label='Add Product'></Button>
                                            </div>
                                        </form>
                                    </div>
                                </>
                        }
                    </Panel>
                </div>
            </div>
        </div>
    )
}

export default AddProduct