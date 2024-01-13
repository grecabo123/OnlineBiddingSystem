import React, { useEffect, useRef } from 'react'
import { DataView, DataViewLayoutOptions } from 'primereact/dataview';
import axios from 'axios';
import { useState } from 'react';
import { Card } from 'primereact/card';
import { Image } from 'primereact/image';
import { Rating } from 'primereact/rating';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { TabView, TabPanel } from 'primereact/tabview';
import { Toast } from 'primereact/toast';
import swal from 'sweetalert';
import { Tag } from 'primereact/tag';
import { GoogleMap, useJsApiLoader, Marker, InfoWindow, Data } from '@react-google-maps/api';
import { Badge } from 'primereact/badge';
import { Divider } from 'primereact/divider';
import { InputTextarea } from 'primereact/inputtextarea';



function Auction() {

    const [ProductData, setProductData] = useState([]);
    const [loading, setloading] = useState(true)
    const [visible, setVisible] = useState(false)
    const [NameProduct, setNameProduct] = useState([]);
    const toast = useRef();
    const [amountbid, setAmountbid] = useState([]);
    const [productkey, setproductkey] = useState([]);
    const [productprice, setproductprice] = useState([]);
    const [productunit, setproductunit] = useState([]);
    const [productdesc, setproductdesc] = useState([]);
    const [bidamt, setbid] = useState([]);
    const [desc, setdesc] = useState()
    const [productlocation, setproductlocation] = useState({
        lat: "",
        lng: "",
        brgy: "",
        color: "",
    });
    const [btndis, setbtndis] = useState(true);

    useEffect(() => {
        FetchAllData();
    }, []);

    const FetchAllData = () => {
        axios.get(`/api/AllItems`).then(res => {
            if (res.data.status === 200) {
                setProductData(res.data.results)
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }

    const PlaceBidOffer = (e) => {
        setVisible(true);
        setNameProduct(e.currentTarget.getAttribute('data-product-name'));
        setproductkey(e.currentTarget.getAttribute('data-product-uniq'));
        setproductprice(e.currentTarget.getAttribute('data-product-price'));
        setproductdesc(e.currentTarget.getAttribute('data-details'));
        setproductunit(e.currentTarget.getAttribute('data-unit'));
        setbid(e.currentTarget.getAttribute('data-bid'));
        setproductlocation({
            lat: e.currentTarget.getAttribute('data-lat'),
            lng: e.currentTarget.getAttribute('data-lng'),
            brgy: e.currentTarget.getAttribute('data-brgy'),
            color: e.currentTarget.getAttribute('data-color').replace(/:/g, ''),
        })
    }
    const AuctionProduct = (e) => {
        e.preventDefault();

        const data = {
            amount: amountbid,
            key: productkey,
            description: desc,
            user_fk: localStorage.getItem('auth_id'),
        };

        axios.post(`/api/PlaceBid`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({ severity: "success", summary: "Place a Bid", details: "Successfully" });
                FetchAllData();
                setVisible(false);
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    const PlaceBidButton = (e) => {
        if (parseFloat(bidamt) < parseFloat(e.target.value).toFixed(2)) {
            setbtndis(false)
            setAmountbid(e.target.value)
        }
        else {
            setbtndis(true)
        }
    }
    const containerStyle = {
        width: '100%',
        height: '300px',
    };

    const butuan = {
        lat: 8.9475,
        lng: 125.5406,

    }

    // console.log(desc);

    const { isLoaded } = useJsApiLoader({
        googleMapsApiKey: "AIzaSyBYboX0tQrX5nexk94H30QwGUgbXCTokJw",
    })



    const itemTemplate = (ProductData) => {
        return (
            <div className="container-fluid">
                <div className="row">
                    <div className="col-lg-12 mb-3">
                        <div className="d-flex justify-content-between align-items-center">
                            <div>
                                <div className="d-flex justify-content-evenly p-2">
                                    <Image className='me-1' preview src={`http://127.0.0.1:8000/${ProductData.image}`} width='200' height='150' />
                                    <div className="m-2 p-3">
                                        <div className='mb-2'> <span className='fs-6'>Product Name:</span> {ProductData.product_name}</div>
                                        <div className='mb-2'> <span className='fs-6'>Product Price:</span> ₱{ProductData.amount_bidding.toFixed(2)}</div>
                                        <div className='mb-2'> <span className='fs-6'>Per Unit:</span> {ProductData.type_of_quantity == 1 ? <Badge severity="info" value="Per Kilo" /> : <Badge severity={'success'} value={"Per Pieces"} />}</div>

                                        <div className='mb-2'> <Rating style={{ color: "yellow" }} value={4} readOnly cancel={false} /></div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                {
                                    ProductData.bidding_item_user_fk == localStorage.getItem('auth_id') ?
                                        <Tag className='' severity={'warning'} value="Your Product" /> :
                                       ProductData.price_status === 2 ? <Badge severity={'danger'} className='p-badge' value={'Pending'} /> :  <Button raised={true}
                                       data-details={ProductData.description}
                                       data-lat={ProductData.lat}
                                       data-lng={ProductData.lng}
                                       data-product-price={ProductData.product_price}
                                       data-brgy={ProductData.brgy_name}
                                       data-color={ProductData.marker_color}
                                       data-product-uniq={ProductData.uniq_key}
                                       data-product-name={ProductData.product_name}
                                       data-unit={ProductData.price_unit}
                                       onClick={PlaceBidOffer}
                                       data-bid={ProductData.amount_bidding}
                                       className='p-button-sm p-button-raised p-button-danger'
                                    //    text={true}
                                       label='Place Bid' />
                                }
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    return (
        <div className='container-fluid'>
            <Toast ref={toast} />
            <Card title="Auction Product">
                <DataView header="List of Products" value={ProductData} loading={loading} itemTemplate={itemTemplate} paginator paginatorPosition='both' paginatorLeft rows={5} className='border-0' />
            </Card>

            <Dialog header={NameProduct} draggable={false} position='top' visible={visible} onHide={() => setVisible(false)}
                style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }}>
                <Divider>
                    <span className='p-tag'>Product Details</span>
                </Divider>

                <div className="container mb-3">
                <ul className="list-group">
                    <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                        Product Name
                        <span>{NameProduct}</span>
                    </li>
                    <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                        Product Price
                        <span>₱{productprice}</span>
                    </li>
                    <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                        Bid Price
                        <span>₱{bidamt}</span>
                    </li>
                    <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                       Price Unit
                        <span>{productunit === 1 ? "Per Kilo" : "Per Pieces"}</span>
                    </li>
                </ul>
                </div>

                <form onSubmit={AuctionProduct}>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Place a Bid
                                </label>
                                <InputText className='w-100' onKeyUp={PlaceBidButton} name='price_bid' keyfilter={'money'} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Comment
                                </label>
                                <InputTextarea className='w-100' rows={5} cols={5} style={{ resize: 'none' }} name='description' onChange={(e) => setdesc(e.target.value)} />
                                {/* <InputText className='w-100' onKeyUp={PlaceBidButton} name='price_bid' keyfilter={'money'} /> */}
                            </div>
                            <div className="d-flex justify-content-end mt-3">
                                <Button disabled={btndis} className='p-button-sm p-button-success' raised label='Place a Bid' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Auction